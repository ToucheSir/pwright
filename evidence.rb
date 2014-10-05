class Evidence
  attr_reader :desc, :name
  def initialize(name, description, quiet=false)
    @desc = description
    @name = name
    $cr << self
    unless quiet
      puts "\n#{name} added to the Court Record.".bold + "\033[0m "
      check(name)
      puts
      `mpg123 -q sfx/evadd.mp3`
    end
  end
  def update(description)
    @desc = description
  end
end

def disp_cr
  puts "Evidence: (type 'check (evidence name)' for more details)"
  $cr.each do |ev|
    puts ev.name
  end
end

def check(name)
  if $cr.select {|x| x.name.split.any? {|i| i.downcase == name.downcase}}[0] || $cr.select {|x| x.name.downcase == name.downcase}[0]
    puts ($cr.select {|x| x.name.split.any? {|i| i.downcase == name.downcase}}[0] || $cr.select {|x| x.name.downcase == name.downcase}[0]).desc
  else
    pr = ($pf.select {|x| x.name.downcase == name.downcase}[0] || $pf.select {|x| x.name.split[0].downcase == name.downcase}[0] || $pf.select {|x| x.name.split[1].downcase == name.downcase}[0])
    if pr.nil?
      puts "Unknown evidence #{name}."
    else
      puts pr.desc
    end
  end
  puts
end

class Profile
  attr_reader :desc, :name
  def initialize(name, description, quiet=false)
    @desc = description
    @name = name
    $pf << self
    unless quiet
      puts "\n#{name} added to the Court Record.".bold + "\033[0m "
      check(name)
      puts
    end
  end
  def update(description)
    @desc = description
  end
end

def disp_pf
  puts "Profiles: (type 'check (name)' for more details)"
  $pf.each do |ev|
    puts ev.name
  end
  puts
end