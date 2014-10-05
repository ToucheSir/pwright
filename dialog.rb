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
  text.split('').each_index.select {|i| text[i] == ','}.each {|x| pauses << x}
  text.split('').each_index.select {|i| text[i] == '.' and text[i..i+2] != '...' and
      text[i-1..i+1] != '...' and text[i-2..i-1] != 'Mr' and text[i-2..i-1] != 'Ms' and
      text[i-2..i+1] != '...?' and text[i-2..i+1] != '...!' and text[i-3..i-1] != 'Mrs'}.each {|x| pauses << x}
  text.split('').each_index.select {|i| text[i] == '!' and text[i+1] != '?' and text[i-1] != '?'}.each {|x| pauses << x}
  text.split('').each_index.select {|i| text[i] == '?' and text[i+1] != '!' and text[i-1] != '!'}.each {|x| pauses << x}

  if text[-4..-1] == "\033[0m"
    pauses -= [text.length-5]
    pauses -= [text.length-6]
  else
    pauses -= [text.length-1]
    pauses -= [text.length-2]
  end
  puts unless $prev == name
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
      end
      $prev = name
      unless RUBY_PLATFORM =~ /win/ or RUBY_PLATFORM =~ /mingw/
        `stty echo`
      end
      return text
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
  end
  $prev = name
  unless RUBY_PLATFORM =~ /win/ or RUBY_PLATFORM =~ /mingw/
    `stty echo`
  end
  text
end

def cutscene(text, name='', pauses=[], delay=0.07, pausedelay=0.2)
  dialog(text, name, pauses, delay, pausedelay, true)
  sleep pausedelay
  text
end