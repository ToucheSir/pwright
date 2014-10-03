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
      Evidence.new("Attorney's Badge", "Type: Other\nOne of my possessions.\nNobody would believe I was a defense attorney if I didn't carry it.", true)
      Evidence.new("Cindy's Autopsy Report", "Type: Reports\nReceived from Mia Fey.\nTime of death: 7/31, 4PM-5PM\nCause of death: loss of blood due to blunt trauma", true)
      Profile.new('Cindy Stone', "Cindy Stone\nAge: 22\nGender: Female\nThe victim in this case. A model, she lived in an apartment by herself.", true)
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
      Profile.new('Mia Fey', "Mia Fey\nAge: 27\nGender: Female\nChief attorney at Fey & Co.. My boss, and a very good defense attorney.")
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
      Profile.new('Larry Butz', "Larry Butz\nAge: 23\nGender: Male\nThe defendant in this case. A likeable guy who was my friend in grade school.")
      sleep 0.4
      dialog('Nick!!!', 'Butz')
      dialog('Hey. Hey there Larry.', 'Phoenix')
      dialog('Dude, I\'m so guilty!! Tell them I\'m guilty!!!', 'Butz')
      dialog('Gimme the death sentence! I ain\'t afraid to die!', 'Butz')
      dialog('What?! What\'s wrong, Larry?', 'Phoenix')
      dialog('Oh, it\'s all over... I... I\'m finished. Finished!', 'Butz', [], 0.1)
      dialog("I can't live in a world without her! I can't!", 'Butz', [], 0.03)
      dialog('Who... who took her away from me, Nick? Who did this?!', 'Butz', [p.index(' ')], 0.03)
      dialog('Aww, Nick, ya gotta tell me! Who took my baby away?!', 'Butz')
      dialog("(Hmm... The person responsible for your girlfriend's death?)".blue, 'Phoenix', [p.index(' ')])
      dialog("(The newspapers say it was ".blue + "you".red + "...)".blue, 'Phoenix')
      puts "\n\n\n"
      dialog('My name is Phoenix Wright.', 'Phoenix')
      dialog("Here's the story:", 'Phoenix')
      dialog('My first case is a fairly simple one.', 'Phoenix')
      dialog('A young woman was killed in her apartment.', 'Phoenix')
      dialog('The guy they arrested was the unlucky sap dating her:', 'Phoenix')
      dialog('Larry Butz... My best friend since grade school.', 'Phoenix', [13])
      dialog('Our school had a saying: "' + 'When something smells, it\'s usually the Butz.'.red + '"', 'Phoenix')
      dialog('In the 23 years I\'ve known him, it\'s usually been true.', 'Phoenix')
      dialog('He has a knack for getting himself in trouble.', 'Phoenix')
      dialog('One thing I can say though: it\'s usually not his fault. He just has terrible luck.', 'Phoenix')
      dialog('But I know better than anyone, that he\'s a good guy at heart.', 'Phoenix')
      dialog('That and I owe him one. Which is why I took the case... to clear his name.', 'Phoenix')
      dialog('And that\'s just what I\'m going to do!', 'Phoenix')
      $save.transaction { $save[:part] = 2 }
      puts "\n\n\nThe game has been saved."
      gets
      part(2)
    when 2
      clearscreen
      Evidence.new("Attorney's Badge", "Type: Other\nOne of my possessions.\nNobody would believe I was a defense attorney if I didn't carry it.", true)
      Evidence.new("Cindy's Autopsy Report", "Type: Reports\nReceived from Mia Fey.\nTime of death: 7/31, 4PM-5PM\nCause of death: loss of blood due to blunt trauma", true)
      Profile.new('Cindy Stone', "Cindy Stone\nAge: 22\nGender: Female\nThe victim in this case. A model, she lived in an apartment by herself.", true)
      Profile.new('Larry Butz', "Larry Butz\nAge: 23\nGender: Male\nThe defendant in this case. A likeable guy who was my friend in grade school.", true)
      Profile.new('Mia Fey', "Mia Fey\nAge: 27\nGender: Female\nChief attorney at Fey & Co.. My boss, and a very good defense attorney.", true)
      dialog(p = "August 3, 10:00 AM\nDistrict Court\nCourtroom No. 2".green.bold, '', (0..p.length).to_a.select {|x| p[x] == "\n"}, 0.1, 0.3)
      dialog("The court is now in session for the trial of Mr. Larry Butz.", 'Judge')
      dialog('The prosecution is ready, Your Honor.', 'Payne')
      Profile.new('Winston Payne', "Winston Payne\nAge: 52\nGender: Male\nThe prosecutor for this case. Lacks presence. Generally bad at getting his points accross.")
      dialog('The, um, defense is ready, Your Honor.', 'Phoenix', [3, 7])
      dialog('Ahem.', 'Judge')
      dialog('Mr. Wright?', 'Judge')
      dialog('This is your first trial, is it not?', 'Judge')
      dialog('Y-Yes, Your Honor. I\'m, um, a little nervous.', 'Phoenix', [1, 23, 27])
      dialog('Your conduct during this trial will decide the fate of your client.', 'Judge')
      dialog('Murder is a serious charge. For your client\'s sake, I hope you can control your nerves.', 'Judge')
      dialog('Thank... thank you, Your Honor.', 'Phoenix')
      dialog('...', 'Judge')
      dialog('Mr. Wright, given the circumstances...', 'Judge', [21])
      dialog('I think we should have a test to ascertain your readiness.', 'Judge')
      dialog('Yes, Your Honor.', 'Phoenix')
      dialog('(Gulp... Hands shaking... Eyesight... fading...)'.blue, 'Phoenix', [13, 29, 41])
      dialog('The test will consist of a few simple questions. Answer them clearly and concisely.', 'Judge')
      dialog('Please state the name of' + ' the defendant '.red + 'in this case.', 'Judge')
      puts "1) Phoenix Wright\n2) Larry Butz\n3) Mia Fey"
      while true
        answer = gets.chomp
        if answer == '2' or answer == '2)'
          break
        elsif answer.downcase == 'cr' or answer.downcase.gsub(/ /, "") == 'courtrecord'
          disp_cr
        elsif answer.downcase == 'pf' or answer.downcase == 'profiles'
          disp_pf
        elsif answer =~ /^check /i
          check answer.split(' ')[1..-1].join(' ')
        elsif answer == '1' or answer == '1)'
          dialog('Um... the defendant... is me, right?', 'Phoenix')
          dialog('Wright! Have you completely lost your mind? Focus!', 'Mia')
          dialog('The defendant is the person on trial!', 'Mia')
          dialog("You're his lawyer!", 'Mia')
          dialog('Um, er, eh? Oh yeah, right! Eh heh heh.', 'Phoenix', [2, 6, 10, 19, 26])
          dialog('This is no laughing matter!', 'Mia')
          dialog("You did pass the bar, didn't you?", 'Mia')
          dialog("Sorry, I couldn't hear your answer. I'll ask you once more:", 'Judge')
          dialog('Please state the name of' + ' the defendant '.red + 'in this case.', 'Judge')
          puts "1) Phoenix Wright\n2) Larry Butz\n3) Mia Fey"
        elsif answer == '3' or answer == '3)'
          dialog('The, um, defendant? That\'s... er... Mia Fey?', 'Phoenix', [3, 7, 18, 28, 34])
          dialog('Wrong, Wright. Look, I have to leave.', 'Mia')
          dialog('I have to go home, I\'m... I\'m expecting a delivery.', 'Mia', [24])
          dialog("Aw, c'mon Chief. There's no need to be going so soon, is there?", 'Phoenix')
          dialog('Wright!', 'Mia')
          dialog('Listen: the defendant is the one on trial -- your client!', 'Mia')
          dialog("I mean, that's about as basic as you can get!", 'Mia')
          dialog("(I put my foot in it this time! I've got to relax!)".blue, 'Phoenix')
          dialog("Sorry, I couldn't hear your answer. I'll ask you once more:", 'Judge')
          dialog('Please state the name of' + ' the defendant '.red + 'in this case.', 'Judge')
          puts "1) Phoenix Wright\n2) Larry Butz\n3) Mia Fey\n\n"
        end
      end
      dialog("The defendant? Well, that's Larry Butz, Your Honor.", 'Phoenix')
      dialog('Correct.', 'Judge')
      dialog('Just keep your wits about you and you\'ll do fine.', 'Judge')
      dialog('Next question:', 'Judge')
      dialog('This is a murder trial. Tell me, what\'s the' + " victim's name".red + '?', 'Judge')
      dialog('(Whew, I know this one! Glad I read the case report cover to cover so many times.)'.blue, 'Phoenix')
      dialog("(It's... wait... Uh-oh!)".blue, 'Phoenix', [7, 15])
      dialog("(No... no way! I forgot! I'm drawing a total blank here!)".blue, 'Phoenix')
      dialog("Phoenix! Are you absolutely SURE you're up to this?", 'Mia')
      dialog("You don't even know the victim's name!?", 'Mia')
      dialog("Oh, the victim! O-Of course I know the victim's name!", 'Phoenix')
      dialog("I, um, just forgot. ... Temporarily.", 'Phoenix', [1, 5, 18, 22])
      dialog("I think I feel a migraine coming on.", 'Mia')
      dialog("Look, the victim's name is listed in the " + "Court Record".red + ".", 'Mia')
      dialog("Just type '" + "cr".red + "' to check evidence and '" + "pf".red + "' to check profiles whenever you get the opportunity to check it, okay?", 'Mia')
      dialog("Remember to check it often. Do it for me, please. I'm begging you.", 'Mia')
      dialog("Let's hear your answer. Who is the " + 'victim'.red + " in this case?", 'Judge')
      puts "1) Mia Fey\n2) Cinder Block\n3) Cindy Stone"
      while true
        answer = gets.chomp
        if answer == '3' or answer == '3)'
          break
        elsif answer.downcase == 'cr' or answer.downcase.gsub(/ /, "") == 'courtrecord'
          disp_cr
        elsif answer.downcase == 'pf' or answer.downcase == 'profiles'
          disp_pf
        elsif answer =~ /^check /i
          check answer.split(' ')[1..-1].join(' ')
        elsif answer == '1' or answer == '1)'
          dialog("Um... Mia Fey?", 'Phoenix')
          dialog("W-W-What?! How can I be the victim?!", 'Mia', [1, 3], 0.02)
          dialog("Oh! Right! Sorry! I, er, it was the first name that popped into my head, and--", 'Phoenix', [2, 9, 16, 19, 23])
          dialog("The Court Record! Remember to use it when you are in a pinch!", 'Mia')
          dialog("Let me ask that one again:", 'Judge')
          dialog("Let's hear your answer. Who is the " + 'victim'.red + "\x1b[39;49m in this case?", 'Judge')
          puts "1) Mia Fey\n2) Cinder Block\n3) Cindy Stone"
        elsif answer == '2' or answer == '2)'
          dialog("Oh, um, wasn't it Ms. Block? Ms. Cinder Block?", 'Phoenix')
          dialog("The person in question was a victim of murder, not ill-conceived naming, Mr. Wright.", 'Judge')
          dialog("Wright?", 'Mia')
          dialog("If you forget anything, just check the Court Record to help you remember.", 'Mia')
          dialog("A mistake in court could cost you the case.", 'Mia')
          dialog("I'll ask you again: ", 'Judge')
          dialog("Let's hear your answer. Who is the " + 'victim'.red + "\x1b[39;49m in this case?", 'Judge')
          puts "1) Mia Fey\n2) Cinder Block\n3) Cindy Stone"
        end
      end
      dialog("Um... the victim's name is Cindy Stone.", 'Phoenix')
      dialog("Correct.", 'Judge')
      dialog("Now, tell me, what was the cause of death?", 'Judge')
      dialog("She died because she was...?", 'Judge')
      puts "1) Poisoned\n2) Hit with a blunt object\n3) Strangled"
  end
end
$save = PStore.new('first.pstore')
if $save.transaction { $save[:part] }.nil? or not $save.transaction { $save[:part] }.is_a? Numeric
  $save.transaction { $save[:part] = 1 }
end
part($save.transaction { $save[:part] })

