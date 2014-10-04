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
      $save.transaction { $save[:part] = 2 }
      puts "\n\n\nThe game has been saved."
      gets
      part(3)
    when 3
      clearscreen
      Evidence.new("Attorney's Badge", "Type: Other\nOne of my possessions.\nNobody would believe I was a defense attorney if I didn't carry it.", true)
      Evidence.new("Cindy's Autopsy Report", "Type: Reports\nReceived from Mia Fey.\nTime of death: 7/31, 4PM-5PM\nCause of death: loss of blood due to blunt trauma", true)
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

  end
end
$save = PStore.new('first.pstore')
if $save.transaction { $save[:part] }.nil? or not $save.transaction { $save[:part] }.is_a? Numeric
  $save.transaction { $save[:part] = 1 }
end
part($save.transaction { $save[:part] })

