class Evidence
  attr_reader :id, :desc, :name
  def initialize(id, name, description)
    @desc = description
    @name = name
    @id = id
    $cr << self
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
  if $cr.select {|x| x.name == name}[0]
    puts $cr.select {|x| x.name == name}[0].desc
  else
    puts ($pf.select {|x| x.name == name}[0] || $pf.select {|x| x.name.split[0] == name}[0] || $pf.select {|x| x.name.split[1] == name}[0]).desc
  end
end

class Profile
  attr_reader :id, :desc, :name
  def initialize(id, name, description, quiet=false)
    @desc = description
    @name = name
    @id = id
    $pf << self
    unless quiet
      puts "#{name} added to the Court Record.".bold + "\033[0m "
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
end