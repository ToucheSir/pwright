require_relative 'dialog'
require 'pstore'
require_relative 'evidence'
$cr = []
$pf = []
$health = 5
def penalize
  $health -= 1
  puts "Penalty! Health left: #{$health}"
  if $health == 0
    dialog('This court sees no reason to further prolong this trial.', 'Judge')
    dialog("Nor is there any need for more time to decide the case against the defendant.", 'Judge')
    dialog("This case is extremely clear. I see no room for misinterpretation of the facts.", 'Judge')
    dialog("This court finds the defendant, Mr. Larry Butz...", 'Judge')
    dialog("Guilty.", 'Judge')
    dialog("The accused will surrender to the court immediately,", 'Judge')
    dialog("to be held pending trial at a higher court within a month from today's date.", 'Judge')
    dialog("That is all. The court is adjourned!")
    puts "Do you want to restart from the latest save point? [y/n]"
    until (answer = gets.chomp.downcase) == 'y' or answer == 'n'
      puts "Do you want to restart from the latest save point? [y/n]"
    end
    if answer == 'y'
      part($save.transaction { $save[:part] })
    else
      exit! 0
    end
  end
end
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
      system('mpg123 -q sfx/rabble.mp3')
      system('mpg123 -q sfx/gavel.mp3')
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
        print '> '
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
        print '> '
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
          dialog("Let's hear your answer. Who is the " + 'victim'.red + " in this case?", 'Judge')
          puts "1) Mia Fey\n2) Cinder Block\n3) Cindy Stone"
        elsif answer == '2' or answer == '2)'
          dialog("Oh, um, wasn't it Ms. Block? Ms. Cinder Block?", 'Phoenix')
          dialog("The person in question was a victim of murder, not ill-conceived naming, Mr. Wright.", 'Judge')
          dialog("Wright?", 'Mia')
          dialog("If you forget anything, just check the Court Record to help you remember.", 'Mia')
          dialog("A mistake in court could cost you the case.", 'Mia')
          dialog("I'll ask you again: ", 'Judge')
          dialog("Let's hear your answer. Who is the " + 'victim'.red + " in this case?", 'Judge')
          puts "1) Mia Fey\n2) Cinder Block\n3) Cindy Stone"
        end
      end
      dialog("Um... the victim's name is Cindy Stone.", 'Phoenix')
      dialog("Correct.", 'Judge')
      dialog("Now, tell me, what was the cause of death?", 'Judge')
      dialog("She died because she was...?", 'Judge')
      puts "1) Poisoned\n2) Hit with a blunt object\n3) Strangled"
      while true
        print '> '
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
          dialog(p = "Oh, right! Wasn't she, um, poisoned by er... poison?", 'Phoenix', [21, 25, p.rindex(' ')])
          dialog("You're asking me?!", 'Judge', [], 0.02)
          dialog(p = "Um... Chief! Help me out!", 'Phoenix', [p.index(' '), p.index('!')])
          dialog("Check the Court Record. Just type 'cr' or 'pf', remember?", 'Mia')
          dialog("(Geez. Give a guy a break!)".blue, 'Phoenix')
          dialog("Let me ask again.", 'Judge')
          dialog("She died because she was...?", 'Judge')
          puts "1) Poisoned\n2) Hit with a blunt object\n3) Strangled"
        elsif answer == '3' or answer == '3)'
          dialog(p="Right... she was strangled, wasn't she?", 'Phoenix', [p.index(' ')])
          dialog("Please tell me that was you talking to yourself.", 'Mia')
          dialog(p="If you wish to hang yourself, Mr. Wright, you are welcome to do so, but not inside my courtroom.", 'Judge', [p.rindex(',')])
          dialog("I suppose there's nothing to do but give you another try:", 'Judge')
          dialog("She died because she was...?", 'Judge')
          puts "1) Poisoned\n2) Hit with a blunt object\n3) Strangled"
        end
      end
      dialog("She was struck once, by a blunt object.", 'Phoenix')
      dialog("Correct.", 'Judge')
      dialog("You've answered all my questions. I see no reason why we shouldn't proceed.", 'Judge')
      dialog(p="You seem much more relaxed, Mr. Wright. Good for you.", 'Judge', [p.index('.')])
      dialog(p="Thank you, Your Honor. " + "(Because I don't FEEL relaxed, that's for sure.)".blue, 'Phoenix', [p.index(',')])
      dialog("Well, then...", 'Judge')
      dialog(p="First, a question for the prosecution. Mr. Payne?", 'Judge', [p.index(','), p.index('.')])
      dialog("Yes, Your Honor?", 'Payne', [3])
      dialog("As Mr. Wright just told us, the victim was struck with a blunt object.", 'Judge')
      dialog("Would you explain to this court just what that \"object\" was?", 'Judge')
      dialog('The murder weapon was this statue of "The Thinker."', 'Payne')
      dialog(p='It was found lying on the floor, next to the victim.', 'Payne', [p.index(',')])
      dialog("I see... the court accepts this into evidence.", 'Judge')
      Evidence.new('Statue', "Statue\nType: Weapons\nSubmitted as evidence by Prosecutor Payne\nA statue in the shape of \"The Thinker.\" It's rather heavy.")
      dialog("Wright...", 'Mia')
      dialog("Be sure to pay attention to any evidence added during the trial.", 'Mia')
      dialog("That evidence is the only ammunition you have in court.", 'Mia')
      dialog("Type 'cr' to check the Court Record frequently.", 'Mia')
      dialog("Mr. Payne, the prosecution may call its first witness.", 'Judge')
      dialog(p="The prosecution calls the defendant, Mr. Butz, to the stand.", 'Payne', [p.index(','), p.rindex(',')])
      dialog("Um, Chief, what do I do now?", 'Phoenix')
      dialog(p="Pay attention. You don't want to miss any information that might help your client's case.", 'Mia', [p.index('.')])
      dialog(p="You'll get your chance to respond to the prosecution later, so be ready!", 'Mia', [p.index(',')])
      dialog(p="Let's just hope he doesn't say anything... unfortunate.", 'Mia', [p.rindex(' ')])
      dialog(p="(Uh oh, Larry gets excited easily... this could be bad.)".blue, 'Phoenix', [p.index('.')+3])
      puts("Larry walks up to the stand...\n\n")
      dialog("Ahem.", 'Payne')
      dialog(p="Mr. Butz, is it not true that the victim had recently dumped you?", 'Payne', [p.index(',')])
      dialog("Hey, watch it buddy!", 'Butz')
      dialog(p="We were great together! We were Romeo and Juliet, Cleopatra and Mark Anthony!", 'Butz', [p.index('!'), p.index(',')])
      dialog(p="(Umm... didn't they all die?)".blue, 'Phoenix', [p.index(' ')], 0.1)
      dialog(p="I wasn't dumped! She just wasn't taking my phone calls. Or seeing me... Ever.", 'Butz', [p.index('!'), p.rindex(' ')])
      dialog("WHAT'S IT TO YOU, ANYWAY?!", 'Butz')
      dialog('Mr. Butz, what you describe is generally what we mean by "dumped."', 'Payne')
      dialog(p="In fact, she had completely abandoned you... and was seeing other men!", 'Payne', [p.index(','), p.index('.')+3])
      dialog("She had just returned from overseas with one of them the day before the murder!", 'Payne')
      dialog('Whaddaya mean, "one of them"?!', 'Butz')
      dialog("Lies! All of it, lies! I don't believe a word of it!", 'Butz', [p.index('!'), p.index('!', p.index('!')+1)])
      dialog("Your Honor, the victim's passport.", 'Payne')
      dialog("According to this, she was in Paris until the day before she died.", 'Payne')
      Evidence.new('Passport', "Victim's Passport\nType: Evidence\nSubmitted as evidence by Prosecutor Payne\nThe victim apparently arrived home from Paris on 7/30, the day before the murder.")
      dialog("Hmm... Indeed, she appears to have returned the day before the murder.", 'Judge')
      dialog("Dude... no way...", 'Butz')
      dialog("The victim was a model, but did not have a large income.", 'Payne', [22])
      dialog('It appears that she had several "Sugar Daddies."', 'Payne')
      dialog("Daddies? Sugar?", 'Butz', [7])
      dialog("Yes. Older men, who gave her money and gifts.", 'Payne')
      dialog("She took their money and used it to support her lifestyle.", 'Payne')
      dialog("Duuude!", 'Butz')
      dialog("We can clearly see what kind of woman this Ms. Stone was.", 'Payne')
      dialog("Tell me, Mr. Butz, " + "what do you think of her now?".red, 'Payne')
      dialog("Wright...", 'Mia')
      dialog("I don't think you want him to answer that question.", 'Mia')
      dialog("(Yeah... Larry has a way of running his mouth in all the wrong directions.)".blue, 'Phoenix')
      dialog("(Should I...?)".blue, 'Phoenix')
      puts "1) Wait and see what happens\n2) Stop him from answering"
      while true
        print '> '
        answer = gets.chomp
        if answer == '1' or answer == '1)'
          dialog('(Might be better not to get involved in this one...)'.blue, 'Phoenix')
          dialog('Well, Mr. Butz?', 'Payne')
          dialog("Dude, no way! That cheatin' she dog!", 'Butz')
          break
        elsif answer == '2' or answer == '2)'
          dialog("My client had no idea the victim was seeing other men!", 'Phoenix')
          dialog("That question is irrelevant to this case!", 'Phoenix')
          dialog("Oof! *wince*", 'Payne')
          dialog('Dude! Nick! Whaddaya mean, "Irrelevant"?!', 'Butz')
          dialog("That cheatin' she dog!", 'Butz')
          break
        elsif answer.downcase == 'cr' or answer.downcase.gsub(/ /, "") == 'courtrecord'
          disp_cr
        elsif answer.downcase == 'pf' or answer.downcase == 'profiles'
          disp_pf
        elsif answer =~ /^check /i
          check answer.split(' ')[1..-1].join(' ')
        end
      end
      dialog("I'm gonna die! I'm just gonna drop dead!", 'Butz')
      dialog("Yeah, and when I meet her in the afterlife...\n", 'Butz', [], 0.05, 0.2, true)
      dialog("I'm going to get to the bottom of this!\n\n", 'Butz', [], 0.02, 0.2, true)
      system('mpg123 -q sfx/rabble.mp3')
      system('mpg123 -q sfx/gavel.mp3')
      dialog("Let's continue with the trial, shall we?", 'Judge')
      dialog("I believe the accused's motive is quite clear to everyone.", 'Payne')
      dialog('Yes, quite', 'Judge')
      dialog('(Oh boy, this is so not looking good.)'.blue, 'Phoenix')
      dialog('Next question!', 'Payne')
      dialog("You went to the victim's apartment on the day of the murder, did you not?", 'Payne')
      dialog('Gulp!', 'Butz')
      dialog('Well, did you or did you not?', 'Payne')
      dialog('Heh? Heh heh. Well, maybe I did, and maybe I didn\'t!', 'Butz')
      dialog('(Uh oh. He went.)'.blue, 'Phoenix')
      dialog('(What do I do?)'.blue, 'Phoenix')
      puts("1) Have him answer honestly\n2) Stop him from answering")
      while true
        print '> '
        answer = gets.chomp
        if answer == '1' or answer == '1)'
          dialog("(I know, I'll send him a signal!)".blue, 'Phoenix')
          puts "You signal Larry to tell the truth.\n\n"
          dialog("Err... Yeah! Yeah! I was there! I went!", 'Butz')
          system('mpg123 -q sfx/rabble.mp3')
          system('mpg123 -q sfx/gavel.mp3')
          dialog("Order!", 'Judge')
          dialog('Well, Mr. Butz?', 'Judge')
          dialog('Dude, chill!', 'Butz')
          dialog("She wasn't home, man... so, like, I didn't see her.", 'Butz')
          puts "Payne: OBJECTION!"
          system('mpg123 -q sfx/wpobj.mp3')
          dialog("Your Honor, the defendant is lying.", 'Payne')
          dialog('Lying?', 'Judge')
          dialog('The prosecution would like to call a witness who can prove Mr. Butz is lying.', 'Payne')
          break
        elsif answer == '2' or answer == '2)'
          dialog("(I'll send him a signal...)".blue, 'Phoenix')
          puts "You signal Larry to lie.\n\n"
          dialog('Um, well, see, it\'s like this: I don\'t remember.', 'Butz')
          dialog('You "Don\'t remember"?', 'Payne')
          dialog("Well then, we'll just have to remind you!", 'Payne')
          dialog('(I have a bad feeling about this...)'.blue, 'Phoenix')
          dialog("We have a witness that can prove he DID go to the victim's apartment that day!", 'Payne')
          break
        elsif answer.downcase == 'cr' or answer.downcase.gsub(/ /, "") == 'courtrecord'
          disp_cr
        elsif answer.downcase == 'pf' or answer.downcase == 'profiles'
          disp_pf
        elsif answer =~ /^check /i
          check answer.split(' ')[1..-1].join(' ')
        end
      end
      $save.transaction { $save[:part] = 3 }
      puts "\n\n\nThe game has been saved."
      gets
      part(3)
    when 3
      clearscreen
      Evidence.new("Attorney's Badge", "Attorney's Badge\nType: Other\nOne of my possessions.\nNobody would believe I was a defense attorney if I didn't carry it.", true)
      Evidence.new("Cindy's Autopsy Report", "Cindy's Autopsy Report\nType: Reports\nReceived from Mia Fey.\nTime of death: 7/31, 4PM-5PM\nCause of death: loss of blood due to blunt trauma", true)
      Evidence.new('Statue', "Statue\nType: Weapons\nSubmitted as evidence by Prosecutor Payne\nA statue in the shape of \"The Thinker.\" It's rather heavy.", true)
      Evidence.new('Passport', "Victim's Passport\nType: Evidence\nSubmitted as evidence by Prosecutor Payne\nThe victim apparently arrived home from Paris on 7/30, the day before the murder.", true)
      Profile.new('Cindy Stone', "Cindy Stone\nAge: 22\nGender: Female\nThe victim in this case. A model, she lived in an apartment by herself.", true)
      Profile.new('Larry Butz', "Larry Butz\nAge: 23\nGender: Male\nThe defendant in this case. A likeable guy who was my friend in grade school.", true)
      Profile.new('Mia Fey', "Mia Fey\nAge: 27\nGender: Female\nChief attorney at Fey & Co.. My boss, and a very good defense attorney.", true)
      Profile.new('Winston Payne', "Winston Payne\nAge: 52\nGender: Male\nThe prosecutor for this case. Lacks presence. Generally bad at getting his points accross.", true)
      dialog("Well, that simplifies matters. Who is your witness?", 'Judge')
      dialog("The man who found the victim's body.", 'Payne')
      dialog("Just before making the gruesome discovery...", 'Payne')
      dialog("He saw the defendant fleeing the scene of the crime!", 'Payne')
      system('mpg123 -q sfx/rabble.mp3')
      system('mpg123 -q sfx/gavel.mp3')
      system('mpg123 -q sfx/gavel.mp3')
      system('mpg123 -q sfx/gavel.mp3')
      dialog("Order! Order in the court!", 'Judge')
      dialog("Mr. Payne, the prosecution may call its witness.", 'Judge')
      dialog('Yes, Your Honor.', 'Payne')
      dialog('(This is bad...)'.blue, 'Phoenix')
      dialog("At the day of the murder, my witness was selling newspapers at the victim's building.", 'Payne')
      dialog("Please bring Mr. Frank Sahwit to the stand!", 'Payne')
      Profile.new('Frank Sahwit', "Frank Sahwit\nAge: 36\nGender: Male\nDiscovered Ms. Stone's body. Newspaper salesman who saw Larry flee the scene.")
      puts "Mr. Sahwit takes the stand...\n\n"
      dialog("Mr. Sahwit, you sell newspaper subscriptions, is this correct?", 'Payne')
      dialog("Oh, oh yes! Newspapers, yes!", 'Sahwit')
      dialog("Mr. Sahwit, you may proceed with your testimony.", 'Judge')
      dialog("Please tell the court what you saw on the day of the murder.", 'Judge')
      puts "                           WITNESS TESTIMONY".bold
      puts "                         --Witness's Account--".red
      `mpg123 -q sfx/testimony.mp3`
      dialog("I was going door-to-door, selling subscriptions when I saw a man fleeing an apartment.", 'Sahwit')
      dialog("I thought he must be in a hurry because he left the door half-open behind him.", 'Sahwit')
      dialog("Thinking it strange, I looked inside the apartment.", 'Sahwit')
      dialog("And then I saw her lying there... a woman... not moving... dead!", 'Sahwit', [32, 43, 57])
      dialog("I quailed in fright and found myself unable to go inside.", 'Sahwit')
      dialog("I thought to call the police immediately!", 'Sahwit')
      dialog("However, the phone in her apartment wasn't working.", 'Sahwit')
      dialog("I went to a nearby park and found a public phone.", 'Sahwit')
      dialog("I remember the time exactly: It was 1:00 PM.", 'Sahwit')
      dialog("The man who ran was, without a doubt, the defendant sitting right over there.", 'Sahwit')
      puts("\n\n")
      dialog('Hmm...', 'Judge')
      dialog("(Larry! Why didn't you tell the truth?)".blue, 'Phoenix')
      dialog "(I can't defend you against a testimony like that!)".blue, 'Phoenix'
      dialog "Incidentally, why wasn't the phone in the victim's apartment working?", 'Judge'
      dialog 'Your Honor, at the time of the murder, there was a blackout in the building.', 'Payne'
      dialog "Aren't phones supposed to work during a blackout?", 'Judge'
      dialog "Yes, Your Honor...", 'Payne'
      dialog "However, some cordless phones do not function normally.", 'Payne'
      dialog "The phone that Mr. Sahwit used was one of those.", 'Payne'
      dialog "Your Honor...", 'Payne'
      dialog "I have a record of the blackout, for your perusal.", 'Payne'
      Evidence.new('Blackout Record', "Blackout Record\nType: Documents\nSubmitted as evidence by Prosecutor Payne\nElectricity to Ms. Stone's building was out from noon to 6PM on the day of the crime.")
      dialog "Now, Mr. Wright...", 'Judge'
      dialog "Yes! Er... yes, Your Honor?", 'Phoenix', [3, 10]
      dialog "You may begin your " + "cross-examination".red + '.', 'Judge'
      dialog "C-Cross-examination".red + ", Your Honor?", 'Phoenix'
      dialog "Alright, Wright, this is it. The real deal!", 'Mia'
      dialog "Uh... what exactly am I supposed to do?", 'Phoenix'
      dialog "Why, you expose the " + "lies".red + " in the testimony the witness just gave!", 'Mia'
      dialog "Lies! What?! He was lying?!", 'Phoenix', [4, 11]
      dialog "Your client is innocent, right?", 'Mia'
      dialog "Then that witness must have lied in his testimony!", 'Mia'
      dialog p="Or is your client really... guilty?", 'Mia', [p.rindex(' ')]
      dialog "!!! How do I prove he's not?", 'Phoenix', [2]
      dialog "You hold the key! It's in the " + "evidence".red + "!", 'Mia'
      dialog "Compare the witness's testimony to the evidence at hand.", 'Mia'
      dialog "There's bound to be a " + "contradiction".red + " in there!", 'Mia'
      dialog "First, find the contradictions between the " + "Court Record" + "and the witness's testimony.", 'Mia'
      dialog "Then, once you've found the contradicting evidence...", 'Mia'
      dialog "present".red + " it and rub it in the witness's face!", 'Mia'
      dialog "Um... okay.", 'Phoenix'
      dialog "Type '" + "present".red + " <evidence name>' to present evidence!", 'Mia'
      dialog "You can also " + "press".red + " the witness by typing '" + "press".red + "'!", 'Mia'
      dialog "Navigate between his statements by typing '" + "next".red + "' and '" + "prev".red + "'!"
      puts "                          Cross-Examination".bold
      puts "                        --Witness's account--".red
      `mpg123 -q sfx/testimony.mp3`
      statements = ["I was going door-to-door, selling subscriptions when I saw a man fleeing an apartment.",
                    "I thought he must be in a hurry because he left the door half-open behind him.",
                    "Thinking it strange, I looked inside the apartment.",
                    "And then I saw her lying there... a woman... not moving... dead!",
                    "I quailed in fright and found myself unable to go inside.",
                    "I thought to call the police immediately!",
                    "However, the phone in her apartment wasn't working.",
                    "I went to a nearby park and found a public phone.",
                    "I remember the time exactly: It was 1:00 PM.",
                    "The man who ran was, without a doubt, the defendant sitting right over there."]
      no = 0
      witness = 'Sahwit'
      dialog statements[no].green, witness
      while true
        print '> '
        answer = gets.chomp
        if answer.downcase == 'cr' or answer.downcase.gsub(/ /, "") == 'courtrecord'
          disp_cr
        elsif answer.downcase == 'pf' or answer.downcase == 'profiles'
          disp_pf
        elsif answer =~ /^check /i
          check answer.split(' ')[1..-1].join(' ')
        elsif answer == 'next'
          no += 1
          if no == statements.length
            dialog("That's all of it.", 'Mia')
            dialog("There must be a contradiction in there somewhere.", 'Mia')
            dialog("Look at the Court Record if something strikes you as being suspicious.", 'Mia')
            dialog("Then, find the evidence that contradicts his testimony, and " + "present".red + " it to him!", 'Mia')
            no = 0
          end
          dialog statements[no].green, witness
        elsif answer == 'prev' or answer == 'previous'
          no = [no - 1, 0].max
          dialog statements[no].green, witness
        elsif answer == 'press'
          puts "Phoenix: HOLD IT!"
          `mpg123 -q sfx/pwholdit.mp3`
          case no
            when 0
              dialog("Isn't a man leaving an apartment common sight?", 'Phoenix')
              dialog("I find it odd that you would take notice of him...", 'Phoenix')
              dialog("Er... heh.", 'Sahwit', [4])
              dialog("I don't know, he just seemed strange to me, that's all.", 'Sahwit')
              dialog("Like he was mad, and yet frightened at the same time.", 'Sahwit')
              dialog('Just like... a criminal fleeing the scene of a crime!', 'Sahwit', [11])
              dialog("The defense requests that the witness refrain from conjecture!", 'Phoenix')
              dialog("Of course. What the witness means is that the man he saw looked suspicious.", 'Payne')
              dialog("So, what happened next?", 'Payne')
            when 1
              dialog("Half-open... you say?", 'Phoenix', [11])
              dialog("Yes, yes, the door was open halfway. Yes.", 'Sahwit')
              dialog("I watched for a moment, but no one came to close the door.", 'Sahwit')
              dialog("\"That's odd, in a big city like this,\" I thought...", 'Sahwit')
              dialog("I see. And what happened next?", 'Payne')
            when 2
              dialog("What gave you the idea to do that?", 'Phoenix')
              dialog("Well, the door was half-open, you see.", 'Sahwit')
              dialog(p="Isn't it only human to want to... peek?", 'Sahwit', [p.rindex(' ')])
              dialog("We climb mountains because they are there! It's the same thing.", 'Sahwit')
              dialog("Truer words have never been spoken! Anyone would look inside!", 'Payne')
              dialog("(Hmm... why did Payne cut him off so quickly?)".blue, 'Phoenix')
              dialog("So, you looked into the apartment. What happened then?", 'Payne')
            when 3
              dialog("Are you sure she was dead?", 'Phoenix')
              dialog("W-Well, no, I guess I wasn't.", 'Sahwit', [1, 6, 10])
              dialog("But, she wasn't moving at all, and there was blood everywhere.", 'Sahwit', [3])
              dialog("(I guess that would look fatal to anyone...)".blue, 'Phoenix')
              dialog("Very well, what happened next?", 'Phoenix')
            when 4
              dialog("So, you didn't touch ANYTHING in the apartment?", 'Phoenix')
              dialog("Um, yes. I mean no! Nothing.", 'Sahwit')
              dialog("Okay. What happened next?", 'Phoenix')
            when 5
              dialog("You \"thought\" to call the police? Does that mean you didn't actually call them?", 'Phoenix')
              dialog("Please, please... Listen to the rest of the testimony.", 'Payne')
              dialog("You thought to call the police... what happened next?", 'Payne')
            when 6
              dialog("The phone in her apartment wasn't working?", 'Phoenix')
              dialog("Yes. I mean, no, no it wasn't. Right.", 'Sahwit')
              dialog("But you said you didn't go into the apartment... or did you?!", 'Phoenix')
              dialog("Oh, oh, that? I can explain that!", 'Sahwit')
              dialog("There was a cordless phone on a shelf in the entranceway.", 'Sahwit')
              dialog("I reached inside and tried using that to call...", 'Sahwit')
              dialog("And that phone wasn't working, correct?", 'Payne')
              dialog("What happened next?", 'Payne')
            when 7
              dialog("Why use a public phone?", 'Phoenix')
              dialog("Well, you see, I don't have a cell phone.", 'Sahwit')
              dialog("And, being the middle of the afternoon, there was no answer at the nearby apartments.", 'Sahwit')
              dialog("Ah, right... what time did you call again?", 'Phoenix')
            when 8
              dialog("1:00 PM! Are you certain?", 'Phoenix', [7])
              dialog("Yes. Absolutely.", 'Sahwit')
              dialog("(Hmm... He seems really confident.)".blue, 'Phoenix')
              dialog("1:00 PM".red + "?", 'Mia')
              dialog("Wright. Doesn't that seem strange to you?", 'Mia')
              dialog("Present some " + 'evidence'.red + " to " + 'contradict'.red + " him!", 'Mia')
              no -= 1
            when 9
              dialog("Are you absolutely, 100% positive?", 'Phoenix')
              dialog("Yes, it was him. No mistake about it.", 'Sahwit')
              dialog("The witness says he's certain!", 'Payne')
          end
          no = [no + 1, statements.length-1].min
          dialog statements[no].green, witness
        elsif answer =~ /^present /
          puts "Phoenix: OBJECTION!"
          `mpg123 -q sfx/pwobj.mp3`
          ev = $cr.select {|x| x.name.split.any? {|i| i.downcase == name.downcase}}[0] || $cr.select {|x| x.name.downcase == name.downcase}[0]
          unless no == 8 and ev.name == "Cindy's Autopsy Report"
            dialog("This evidence clearly reveals the contradiction in this statement!", 'Phoenix')
            dialog("How exactly are that evidence and the statement just now related?", 'Judge')
            dialog("They aren't, are they...", 'Phoenix')
            dialog("Not at all.", 'Judge')
            dialog("Mr. Wright, please think the facts over before making accusations.", 'Judge')
            penalize
            dialog("(I don't think that won me any points with the judge...)".blue, 'Phoenix')
            dialog statements[no].green, witness
          else
            break
          end
        end
      end
      dialog("You found the body at 1:00 PM. You're sure?", 'Phoenix')
      dialog("Yes. It was 1:00 PM, for certain.", 'Sahwit')
      dialog("Frankly, I find that hard to believe!", 'Phoenix')
      dialog("Your statement directly contradicts the autopsy report.", 'Phoenix')
      dialog("The autopsy report notes the time of death at some time after " + "4 PM".red + ".", 'Phoenix')
      dialog('There was nobody to... er... no "body" to find at 1:00 PM!', 'Phoenix', [21, 27])
      dialog("How do you explain this three-hour gap?", 'Phoenix')
      dialog("!!!", 'Sahwit')
      dialog("Oh, that! Oh, er...", 'Sahwit', [2, 8, 12])
      puts "Payne: OBJECTION!"
      system('mpg123 -q sfx/wpobj.mp3')
      dialog("This is trivial! The witness merely forgot the time!", 'Payne')
      dialog(p="After his testimony, I find that hard to believe.", 'Judge', [p.index(',')])
      dialog("Mr. Sahwit...", 'Judge')
      dialog("Why were you so certain that you found the body at 1:00 PM?", 'Judge')
      dialog("I... er... well, I... Gee, that's a really good question!", 'Sahwit', [3, 9, 15, 20, 25])
      dialog("Great job, Wright! Way to put him on the spot!", 'Mia')
      dialog("That's all you have to do: point out contradictions!", 'Mia')
      dialog("Lies always beget more lies!", 'Mia')
      dialog(p="See through one, and their whole story falls apart!", 'Mia', [p.index(',')])
      dialog(p="Wait! I remember now!", 'Sahwit', [p.index('!')])
      dialog("Would you care to give your testimony again?", 'Judge')
  end
end
$save = PStore.new('first.pstore')
if $save.transaction { $save[:part] }.nil? or not $save.transaction { $save[:part] }.is_a? Numeric
  $save.transaction { $save[:part] = 1 }
end
part($save.transaction { $save[:part] })

