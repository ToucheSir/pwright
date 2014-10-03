class Profile
  attr_reader :id, :desc, :name
  def initialize(id, name, description)
    @desc = description
    @name = name
    @id = id
    $pf << self
  end
  def update(description)
    @desc = description
  end
end

def disp_pf
  puts "Profile: (type 'check (name)' for more details)"
  $pf.each do |ev|
    puts ev.name
  end
end

def checkpf(name)
  puts $pf.select {|x| x.name == name}[0].desc
end