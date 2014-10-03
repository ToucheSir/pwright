require_relative 'dialog'
require 'pstore'
require_relative 'evidence'
$cr = []
$pf = []
def part(id)
  $cr = []
  $pf = []
  case id
    when 1
      cutscene(p = '*gasp*... *gasp*... ', '', (0..p.length).to_a.select {|x| p[x] == ' '})
      puts "\n\n"
      cutscene(p = 'Dammit! ', '', [p.length], 0.02)
      cutscene('...Why me?')
      puts "\n\n"
      cutscene(p = "I can't get caught...\n", '', [p.length])
      cutscene('Not like this!', '', [], 0.02)
      puts "\n\n"
      cutscene(p = "I-I've got to find someone to pin this on...\n", '', [1])
      cutscene(p = 'Someone like... ', '', [p.length])
      cutscene('him!', '', [], 0.02)
      puts "\n\n"
      cutscene("I'll make it look like HE did it!")
      gets
      clearscreen
      dialog(p = "August 3, 9:47 AM\nDistrict Court\nDefendant Lobby No. 2".green.bold, '', (0..p.length).to_a.select {|x| p[x] == "\n"}, 0.1, 0.3)
      puts
      dialog('(Boy am I nervous!)'.blue, 'Phoenix')
      dialog('Wright!', 'Mia', [], 0.03)
      dialog(p = 'Oh, h-hiya, Chief!', 'Phoenix', [p.index('-')], 0.02)
      Profile.new(0, 'Mia Fey', "Mia Fey\nAge: 27\nGender: Female\nChief attorney at Fey & Co.. My boss, and a very good defense attorney.")
      dialog("Whew, I'm glad I made it on time.", 'Mia')
      dialog("Well, I have to say Phoenix, I'm impressed!", 'Mia')
      dialog("Not everyone takes on a murder trial right off the bat like this.", 'Mia')
      dialog(p = "It says a lot about you... and your client as well.", 'Mia', [19], 0.05, 0.6)
      dialog('Umm... thanks.', 'Phoenix')
      dialog("Actually, it's because I owe him a favor.", 'Phoenix')
      dialog('A favor?', 'Mia', [], 0.02)
      dialog('You mean, you knew the defendant before this case?', 'Mia')
      dialog('Yes.', 'Phoenix')
      dialog('Actually, I kind of owe my current job to him.', 'Phoenix')
      dialog("He's one of the reasons I became an attorney.", 'Phoenix')
      dialog("Well, that's news to me!", 'Mia')
      dialog('I want to help him out any way I can!', 'Phoenix')
      dialog('I just... really want to help him. I owe him that much.', 'Phoenix')
      dialog("(It's over!)".green.bold, '???')
      dialog("(My life, everything, it's all over!)".green.bold, '???')
      dialog('...', 'Mia')
      dialog("Isn't that your client screaming over there?", 'Mia', [21])
      dialog('Yeah... that\'s him.', 'Phoenix')
      dialog("(Death! Despair! Ohhhh!)".green.bold, '???')
      dialog("(I'm gonna do it, I'm gonna die!!!)".green.bold, '???')
      dialog('It sounds like he wants to die...', 'Mia')
      dialog('Um, yeah. *sigh*', 'Phoenix')
      puts "Your client, Larry Butz, comes over to you, crying.\n\n"
      Profile.new(1, 'Larry Butz', "Larry Butz\nAge: 23\nGender: Male\nThe defendant in this case. A likeable guy who was my friend in grade school.")
      sleep 0.4
      dialog('Nick!!!', 'Butz')
      dialog('Hey. Hey there Larry.', 'Phoenix')
      dialog('Dude, I\'m so guilty!! Tell them I\'m guilty!!!', 'Butz')
      dialog('Gimme the death sentence! I ain\'t afraid to die!', 'Butz')
      dialog('What?! What\'s wrong, Larry?', 'Phoenix')
      dialog('Oh, it\'s all over... I... I\'m finished. Finished!', 'Butz', [], 0.1)
  end
end
$save = PStore.new('first.pstore')
if $save.transaction { $save[:part] }.nil? or not $save.transaction { $save[:part] }.is_a? Numeric
  $save.transaction { $save[:part] = 1 }
end
part($save.transaction { $save[:part] })

