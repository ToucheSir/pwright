require_relative 'colorize'
begin
  require 'win32/console/ANSI' if RUBY_PLATFORM =~ /win/ or RUBY_PLATFORM =~ /mingw/
rescue LoadError
  raise 'You must use "gem install win32console" before using colors.'
end

def clearscreen
  if RUBY_PLATFORM =~ /win/ or RUBY_PLATFORM =~ /mingw/
    system 'cls'
  else
    system 'clear'
  end
end

class IO
  def ready?
    result = IO.select([self], nil, nil, 0)
    result && (result.first.first == self)
  end
end
def char_if_pressed
  c = nil
  if $stdin.ready?
    if RUBY_PLATFORM =~ /win/ or RUBY_PLATFORM =~ /mingw/
      require 'win32api'
      c = Win32API.new('crtdll', '_getch', [], 'L').Call
    else
      system("stty raw") # turn raw input on
      c = $stdin.getc
      system("stty -raw") # turn raw input off
    end
  end
  c.chr if c
end

def dialog(text, name='', pauses=[], delay=0.05, pausedelay=0.2, autoend=false)
  unless name == ''; print "#{name}: " end
  unless RUBY_PLATFORM =~ /win/ or RUBY_PLATFORM =~ /mingw/
    `stty -echo`
  end
  sleep(pausedelay)
  current_color = "\033[0m"
  i = 0
  until i > text.length
    chr = text[i]
    if (p = char_if_pressed) == "\n" or p == "\r" and not autoend
      print "#{current_color}#{text[i..-1]}"
      unless autoend
        gets
        puts
      end
      unless RUBY_PLATFORM =~ /win/ or RUBY_PLATFORM =~ /mingw/
        `stty echo`
      end
      return
    end
    while text[i..i+4] =~ /^\033\[[0-9]+m/
      if $~.string.include? "\033[0m"
        current_color = current_color[0...current_color.rindex("\033")]
      else
        current_color += text[i..text.index('m',i)]
      end
      i = text.index('m', i) + 1
      chr = text[i]
    end
    print "#{current_color}#{chr}#{"\033[0m" * current_color.count('m')}"
    if pauses.include? i
      sleep(pausedelay)
    end
    sleep(delay)
    i += 1
  end
  unless autoend
    gets
    puts
  end
  unless RUBY_PLATFORM =~ /win/ or RUBY_PLATFORM =~ /mingw/
    `stty echo`
  end
end

def cutscene(text, name='', pauses=[], delay=0.07, pausedelay=0.2)
  dialog(text, name, pauses, delay, pausedelay, true)
  sleep pausedelay
end