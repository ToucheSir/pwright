require_relative 'dialog'
require_relative 'evidence'
$cr = []
$pf = []
$health = 5
def penalize
  $health -= 1
  `mpg123 -q sfx/penalty.mp3`
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
    $health = 5
    puts "Do you want to restart from the latest save point? [y/n]"
    until (answer = gets.chomp.downcase) == 'y' or answer == 'n'
      puts "Do you want to restart from the latest save point? [y/n]"
    end
    if answer == 'y'
      part($save.transaction { $save[:part] })
      exit! 0
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
      `mpg123 -q sfx/save.mp3`
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
          puts "\n1) Phoenix Wright\n2) Larry Butz\n3) Mia Fey\n"
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
      puts("\nLarry walks up to the stand...\n")
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
      dialog('Yes, quite.', 'Judge')
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
          puts "\nYou signal Larry to tell the truth.\n"
          dialog("Err... Yeah! Yeah! I was there! I went!", 'Butz')
          system('mpg123 -q sfx/rabble.mp3')
          system('mpg123 -q sfx/gavel.mp3')
          dialog("Order!", 'Judge')
          dialog('Well, Mr. Butz?', 'Judge')
          dialog('Dude, chill!', 'Butz')
          dialog("She wasn't home, man... so, like, I didn't see her.", 'Butz')
          puts "Payne: OBJECTION!"
          system('mpg123 -q sfx/wpobj.mp3')
          $prev = 'Payne'
          dialog("Your Honor, the defendant is lying.", 'Payne')
          dialog('Lying?', 'Judge')
          dialog('The prosecution would like to call a witness who can prove Mr. Butz is lying.', 'Payne')
          break
        elsif answer == '2' or answer == '2)'
          dialog("(I'll send him a signal...)".blue, 'Phoenix')
          puts "\nYou signal Larry to lie.\n"
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
      `mpg123 -q sfx/save.mp3`
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
      dialog "Navigate between his statements by typing '" + "next".red + "' and '" + "prev".red + "'!", 'Mia'
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
          $prev = 'Phoenix'
          `mpg123 -q sfx/pwholdit.mp3`
          case no
            when 0
              dialog("Isn't a man leaving an apartment common sight?", 'Phoenix')
              dialog("I find it odd that you would take notice of him...", 'Phoenix')
              dialog("Er... heh.", 'Sahwit')
              dialog("I don't know, he just seemed strange to me, that's all.", 'Sahwit')
              dialog("Like he was mad, and yet frightened at the same time.", 'Sahwit')
              dialog('Just like... a criminal fleeing the scene of a crime!', 'Sahwit')
              dialog("The defense requests that the witness refrain from conjecture!", 'Phoenix')
              dialog("Of course. What the witness means is that the man he saw looked suspicious.", 'Payne')
              dialog("So, what happened next?", 'Payne')
            when 1
              dialog("Half-open... you say?", 'Phoenix')
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
              dialog("W-Well, no, I guess I wasn't.", 'Sahwit', [1])
              dialog("But, she wasn't moving at all, and there was blood everywhere.", 'Sahwit')
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
          $prev = 'Phoenix'
          `mpg123 -q sfx/pwobj.mp3`
          name = answer.split[1..-1].join ' '
          ev = $cr.select {|x| x.name.downcase.include? name.downcase}[0] || $pf.select {|x| x.name.downcase.include? name.downcase}[0]
          if ev.nil?
            puts "Unknown evidence: #{name}"
          else
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
      end
      dialog("You found the body at 1:00 PM. You're sure?", 'Phoenix')
      dialog("Yes. It was 1:00 PM, for certain.", 'Sahwit')
      dialog("Frankly, I find that hard to believe!", 'Phoenix')
      dialog("Your statement directly contradicts the autopsy report.", 'Phoenix')
      dialog("The autopsy report notes the time of death at some time after " + "4 PM".red + ".", 'Phoenix')
      dialog('There was nobody to... er... no "body" to find at 1:00 PM!', 'Phoenix')
      dialog("How do you explain this three-hour gap?", 'Phoenix')
      dialog("!!!", 'Sahwit')
      dialog("Oh, that! Oh, er...", 'Sahwit')
      puts "Payne: OBJECTION!"
      system('mpg123 -q sfx/wpobj.mp3')
      dialog("This is trivial! The witness merely forgot the time!", 'Payne')
      dialog("After his testimony, I find that hard to believe.", 'Judge')
      dialog("Mr. Sahwit...", 'Judge')
      dialog("Why were you so certain that you found the body at 1:00 PM?", 'Judge')
      dialog("I... er... well, I... Gee, that's a really good question!", 'Sahwit')
      dialog("Great job, Wright! Way to put him on the spot!", 'Mia')
      dialog("That's all you have to do: point out contradictions!", 'Mia')
      dialog("Lies always beget more lies!", 'Mia')
      dialog("See through one, and their whole story falls apart!", 'Mia')
      dialog("Wait! I remember now!", 'Sahwit')
      dialog("Would you care to give your testimony again?", 'Judge')
      $save.transaction{ $save[:part] = 4 }
      `mpg123 -q sfx/save.mp3`
      puts "The game has been saved."
      gets
      part(4)
    when 4
      Evidence.new("Attorney's Badge", "Attorney's Badge\nType: Other\nOne of my possessions.\nNobody would believe I was a defense attorney if I didn't carry it.", true)
      Evidence.new("Cindy's Autopsy Report", "Cindy's Autopsy Report\nType: Reports\nReceived from Mia Fey.\nTime of death: 7/31, 4PM-5PM\nCause of death: loss of blood due to blunt trauma", true)
      Evidence.new('Statue', "Statue\nType: Weapons\nSubmitted as evidence by Prosecutor Payne\nA statue in the shape of \"The Thinker.\" It's rather heavy.", true)
      Evidence.new('Passport', "Victim's Passport\nType: Evidence\nSubmitted as evidence by Prosecutor Payne\nThe victim apparently arrived home from Paris on 7/30, the day before the murder.", true)
      Evidence.new('Blackout Record', "Blackout Record\nType: Documents\nSubmitted as evidence by Prosecutor Payne\nElectricity to Ms. Stone's building was out from noon to 6PM on the day of the crime.", true)
      Profile.new('Cindy Stone', "Cindy Stone\nAge: 22\nGender: Female\nThe victim in this case. A model, she lived in an apartment by herself.", true)
      Profile.new('Larry Butz', "Larry Butz\nAge: 23\nGender: Male\nThe defendant in this case. A likeable guy who was my friend in grade school.", true)
      Profile.new('Mia Fey', "Mia Fey\nAge: 27\nGender: Female\nChief attorney at Fey & Co.. My boss, and a very good defense attorney.", true)
      Profile.new('Winston Payne', "Winston Payne\nAge: 52\nGender: Male\nThe prosecutor for this case. Lacks presence. Generally bad at getting his points accross.", true)
      Profile.new('Frank Sahwit', "Frank Sahwit\nAge: 36\nGender: Male\nDiscovered Ms. Stone's body. Newspaper salesman who saw Larry flee the scene.", true)
      puts "                           WITNESS TESTIMONY".bold
      puts "                       --The Time of Discovery--".red
      system("mpg123 -q sfx/testimony.mp3")
      statements = []
      statements << dialog("You see, when I found the body, I heard the time.", 'Sahwit')
      statements << dialog("There was a voice saying the time... It was probably coming from the television.", 'Sahwit')
      statements << dialog("Oh, but it was three hours off, wasn't it?", 'Sahwit')
      statements << dialog("I guess the victim must have been watching a video of a taped program!", 'Sahwit')
      statements << dialog("That's why I thought it was 1:00 PM!", 'Sahwit')
      statements << dialog("Terribly sorry about the misunderstanding...", 'Sahwit')
      dialog("Hmm... I see. You heard a voice say the time on a taped program.", 'Judge')
      dialog("Mr. Wright, you may cross-examine the witness.", 'Judge')
      dialog("Wright!", 'Mia')
      dialog("You know what to do!", 'Mia')
      dialog("I've got this one.", 'Phoenix')
      puts "                           CROSS-EXAMINATION".bold
      puts "                       --The Time of Discovery--".red
      system("mpg123 -q sfx/testimony.mp3")
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
            dialog("Notice anything suspicious?", 'Mia')
            no = 0
          end
          dialog statements[no].green, witness
        elsif answer == 'prev' or answer == 'previous'
          no = [no - 1, 0].max
          dialog statements[no].green, witness
        elsif answer == 'press'
          puts "Phoenix: HOLD IT!"
          $prev = 'Phoenix'
          `mpg123 -q sfx/pwholdit.mp3`
          case no
            when 0
              dialog('You said "heard"... not "saw"?', 'Phoenix')
              dialog("Yes, heard.", 'Sahwit')
              dialog("All I saw was the body lying there...", 'Sahwit')
              dialog("I didn't think to look anywhere else, least of all my watch.", 'Sahwit')
              dialog("Hmm... Isn't that a little strange?", 'Phoenix')
              dialog('So you\'re saying you "heard" something.', 'Phoenix')
              dialog('But if you were so shocked by the body, you wouldn\'t hear anything at all!', 'Phoenix')
              puts "Payne: OBJECTION!"
              $prev = 'Payne'
              `mpg123 -q sfx/wpobj.mp3`
              dialog("The witness did say he actually heard the time.", 'Payne')
              dialog("It's ludicrous to suggest he \"wouldn't hear anything\"!", 'Payne')
              dialog("Hmm... I have to agree with the prosecution.", 'Judge')
              dialog("Witness, continue your testimony.", 'Judge')
            when 1
              dialog("Are you sure it was a television and not... a radio?", 'Phoenix')
              dialog("Well, no, I guess it might have been a radio.", 'Sahwit')
              dialog("Incidentally, there was no radio on the premises.", 'Payne')
              dialog("There was only one large television.", 'Payne')
              dialog("Wright!", 'Mia')
              dialog("I can't put my finger on it, but something about this seems fishy.", 'Mia')
              dialog('Something about "hearing" the television...', 'Mia')
              dialog("The witness has testified. He heard the time.", 'Payne')
            when 2
              dialog("How do you explain the gap!", 'Phoenix')
              dialog("Well, witness? Can you explain this?", 'Judge')
            when 3
              dialog("A... video?", 'Phoenix')
              dialog("Yes, that would explain why the time is wrong!", 'Sahwit')
              dialog("True, true...", 'Phoenix')
              dialog("Wright!", 'Mia')
              dialog('I think the problem lies someplace else...', 'Mia')
              dialog("We're agreed that you heard the time at the scene, then.", 'Judge')
            when 4
              dialog("Are you sure the voice you heard said it was 1:00 PM?", 'Phoenix')
              dialog("Yes. I can practically hear it now. It was quite clear.", 'Sahwit')
              dialog("Mr. Payne, has the prosecution verified this testimony?", 'Judge')
              dialog("My apologies, Your Honor.", 'Payne')
              dialog("I, too, have only just learned that the witness \"heard\" the time.", 'Payne')
              dialog("Oh, I'm really sorry. I only remembered it just now.", 'Sahwit')
            when 5
              dialog("Well, you just watch it!", 'Phoenix')
              dialog("(Hmm... Not much point pressing him on that one, was there?)".blue, 'Phoenix')
          end
          no = [no + 1, statements.length-1].min
          dialog statements[no].green, witness
        elsif answer =~ /^present /
          puts "Phoenix: OBJECTION!"
          $prev = 'Phoenix'
          `mpg123 -q sfx/pwobj.mp3`
          name = answer.split[1..-1].join ' '
          ev = $cr.select {|x| x.name.downcase.include? name.downcase}[0] || $pf.select {|x| x.name.downcase.include? name.downcase}[0]
          if ev.nil?
            puts "Unknown evidence: #{name}"
          else
            unless no != 5 and ev.name == 'Blackout Record'
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
      end
      dialog("Hold it right there!", 'Phoenix')
      dialog("The prosecution has said there was a blackout at the time of the discovery!", 'Phoenix')
      dialog("And this record proves it!", 'Phoenix')
      dialog('...!', 'Sahwit')
      dialog("You couldn't have heard a television... or a video!", 'Phoenix')
      dialog("Gah!!!", 'Sahwit')
      dialog("I... well... urk!", 'Sahwit')
      dialog("The defense has a point.", 'Judge')
      dialog("Do you have an explanation for this, Mr. Sahwit?", 'Judge')
      dialog("No, I... I find it quite puzzling myself! Quite!", 'Sahwit')
      dialog('...', 'Sahwit')
      cutscene("Aah!\n", 'Sahwit', [], 0.02)
      dialog("W-wait! I remember now!", 'Sahwit', [1])
      dialog("Mr. Sahwit?", 'Judge')
      dialog("The court would prefer to hear an accurate testimony from the very beginning.", 'Judge')
      dialog("These constant corrections are harming your credibility.", 'Judge')
      dialog("That and you seem rather... distraught.", 'Judge')
      dialog("...!", 'Sahwit')
      dialog("M-my apologies, Your Honor!", 'Sahwit', [1])
      dialog("It... er, it must have been the shock of finding the body!", 'Sahwit')
      dialog("Very well, Mr. Sahwit.", 'Judge')
      dialog("Let's hear your testimony once more please.", 'Judge')
      $save.transaction{ $save[:part] = 5 }
      `mpg123 -q sfx/save.mp3`
      puts "The game has been saved."
      gets
      part(5)
    when 5
      Evidence.new("Attorney's Badge", "Attorney's Badge\nType: Other\nOne of my possessions.\nNobody would believe I was a defense attorney if I didn't carry it.", true)
      Evidence.new("Cindy's Autopsy Report", "Cindy's Autopsy Report\nType: Reports\nReceived from Mia Fey.\nTime of death: 7/31, 4PM-5PM\nCause of death: loss of blood due to blunt trauma", true)
      Evidence.new('Statue', "Statue\nType: Weapons\nSubmitted as evidence by Prosecutor Payne\nA statue in the shape of \"The Thinker.\" It's rather heavy.", true)
      Evidence.new('Passport', "Victim's Passport\nType: Evidence\nSubmitted as evidence by Prosecutor Payne\nThe victim apparently arrived home from Paris on 7/30, the day before the murder.", true)
      Evidence.new('Blackout Record', "Blackout Record\nType: Documents\nSubmitted as evidence by Prosecutor Payne\nElectricity to Ms. Stone's building was out from noon to 6PM on the day of the crime.", true)
      Profile.new('Cindy Stone', "Cindy Stone\nAge: 22\nGender: Female\nThe victim in this case. A model, she lived in an apartment by herself.", true)
      Profile.new('Larry Butz', "Larry Butz\nAge: 23\nGender: Male\nThe defendant in this case. A likeable guy who was my friend in grade school.", true)
      Profile.new('Mia Fey', "Mia Fey\nAge: 27\nGender: Female\nChief attorney at Fey & Co.. My boss, and a very good defense attorney.", true)
      Profile.new('Winston Payne', "Winston Payne\nAge: 52\nGender: Male\nThe prosecutor for this case. Lacks presence. Generally bad at getting his points accross.", true)
      Profile.new('Frank Sahwit', "Frank Sahwit\nAge: 36\nGender: Male\nDiscovered Ms. Stone's body. Newspaper salesman who saw Larry flee the scene.", true)
      puts "                           WITNESS TESTIMONY".bold
      puts "                          --Hearing the Time--".red
      system("mpg123 -q sfx/testimony.mp3")
      statements = []
      statements << dialog("Actually, I didn't \"hear\" the time, I \"saw\" it!", 'Sahwit')
      statements << dialog("There was a table clock in the apartment, wasn't there!", 'Sahwit')
      statements << dialog("Yeah, the murder weapon! The killer used it to hit the victim!", 'Sahwit')
      statements << dialog("That must have been what I saw.", 'Sahwit')
      dialog("You saw a clock? I guess that would explain it.", 'Judge')
      dialog("The defense may cross-examine the witness.", 'Judge')
      dialog("Gladly.", 'Phoenix')
      puts "                           CROSS-EXAMINATION".bold
      puts "                          --Hearing the Time--".red
      system("mpg123 -q sfx/testimony.mp3")
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
            dialog("Now, find the contradiction!", 'Mia')
            no = 0
          end
          dialog statements[no].green, witness
        elsif answer == 'prev' or answer == 'previous'
          no = [no - 1, 0].max
          dialog statements[no].green, witness
        elsif answer == 'press'
          puts "Phoenix: HOLD IT!"
          $prev = 'Phoenix'
          `mpg123 -q sfx/pwholdit.mp3`
          case no
            when 0
              dialog("That strikes me as a very suspicious mistake.", 'Phoenix')
              dialog("Yes, I can see how you'd be a little doubtful...", 'Sahwit')
              dialog("I'm really sorry. I only just remembered that table clock.", 'Sahwit')
              dialog('A "table clock"?', 'Judge')
            when 1
              dialog('A "table clock"? Was there a clock at the scene?', 'Phoenix')
              dialog("This is the first I've heard of it!", 'Judge')
            when 2
              dialog("The... murder weapon?", 'Phoenix')
              dialog("Yes, the table clock that was used as a weapon!", 'Sahwit')
              dialog("That's what I just said. Did you doze off in the middle of my testimony or something?", 'Sahwit')
              dialog("(Something's fishy here...)".blue, 'Phoenix')
            when 3
              dialog("Why didn't you tell us that in the first place?", 'Phoenix')
              dialog("I guess it just slipped my mind!", 'Sahwit')
              dialog("I'm not really sure how it happened myself...", 'Sahwit')
              dialog("The witness says he saw the table clock. End of story.", 'Payne')
          end
          no += 1
          if no == statements.length
            dialog("Now, find the contradiction!", 'Mia')
            no = 0
          end
          dialog statements[no].green, witness
        elsif answer =~ /^present /
          puts "Phoenix: OBJECTION!"
          $prev = 'Phoenix'
          `mpg123 -q sfx/pwobj.mp3`
          name = answer.split[1..-1].join ' '
          ev = $cr.select {|x| x.name.downcase.include? name.downcase}[0] || $pf.select {|x| x.name.downcase.include? name.downcase}[0]
          if ev.nil?
            puts "Unknown evidence: #{name}"
          else
            unless no != 0 and ev.name == 'Statue'
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
      end
      dialog("Wait just a moment!", 'Phoenix')
      dialog("The murder weapon wasn't a clock. It was this statue!", 'Phoenix')
      dialog("Now how is this supposed to be a clock?!", 'Phoenix')
      cutscene("Gwaah!\n", 'Sahwit')
      dialog('Y-You with your "objections," and your "evidence"... Just who do you think you are?!', 'Sahwit')
      dialog("Just answer the question, Mr. Sahwit.", 'Phoenix')
      dialog("Hey, I... I saw it there, okay! That's a clock!", 'Sahwit')
      dialog("Your Honor! If I may...", 'Payne')
      dialog("Yes, Mr. Payne?", 'Judge')
      dialog("As the witness stated, this statue is indeed a clock.", 'Payne')
      dialog("The neck is a switch. You just tilt it, and it says the time out loud.", 'Payne')
      dialog("As it doesn't look like a clock, I submitted it as a statue. My apologies.", 'Payne')
      dialog("I see.", 'Judge')
      dialog("So the murder weapon was a table clock after all.", 'Judge')
      dialog("Well, Mr. Wright?", 'Judge')
      dialog("It appears that the witness's testimony was correct. This is a clock.", 'Judge')
      dialog("Do you have any problems with his testimony now?", 'Judge')
      puts "[y/n]"
      until (answer = gets.chomp.downcase) == 'y' or answer == 'n'
        puts "[y/n]"
      end
      if answer == 'y'
        dialog("Your Honor, there is a gaping hole in the witness's testimony!", 'Phoenix')
      else
        dialog("I guess not.", 'Phoenix')
        dialog("There was a clock on the scene, so, no problem.", 'Phoenix')
        dialog("Wright! Are you out of your mind?!", 'Mia')
        dialog("That clock doesn't look like a clock at all!", 'Mia')
        dialog("The witness couldn't have known it was a clock just by seeing it!", 'Mia')
        dialog("He said himself, he never entered the apartment!", 'Mia')
        dialog("It was in his testimony!", 'Mia')
        dialog("Hey! You're right!", 'Phoenix')
        dialog("Is something the matter? Does the defense have anything to add?", 'Judge')
        dialog("Yes... Yes I do!", 'Phoenix')
      end
      dialog("The only way he could've known the weapon was a clock was to hold it in his hands.", 'Phoenix')
      dialog("Yet the witness testified that he didn't enter the apartment.", 'Phoenix')
      dialog("Clearly, a contradiction!", 'Phoenix')
      dialog("Hmm... indeed!", 'Judge')
      dialog("The witness knew it was a clock, because he...", 'Phoenix')
      puts "1) Went into the apartment\n2) Knew the victim"
      while true
        print '> '
        answer = gets.chomp
        if answer == '1' or answer == '1)'
          break
        elsif answer.downcase == 'cr' or answer.downcase.gsub(/ /, "") == 'courtrecord'
          disp_cr
        elsif answer.downcase == 'pf' or answer.downcase == 'profiles'
          disp_pf
        elsif answer =~ /^check /i
          check answer.split(' ')[1..-1].join(' ')
        elsif answer == '2' or answer == '2)'
          dialog("Tell me, isn't it true that you knew the victim?", 'Phoenix')
          dialog('In fact, you were one of her "sugar daddies"! Be frank with us, Mr. Sahwit!', 'Phoenix')
          dialog('"Frank"? I\'m always "Frank"', 'Sahwit')
          dialog('Your Honor.', 'Payne')
          dialog('We have complete records of the victim\'s relationships.', 'Payne')
          dialog("Frank Sahwit does not appear anywhere.", 'Payne')
          dialog("Huh? Oh, really?", 'Phoenix')
          dialog('Please, Mr. Wright... Is "Huh" really the best response you can muster up?', 'Judge')
          dialog("Try to refrain from making off-the-cuff accusations in the future.", 'Judge')
          dialog("Y-Yes, Your Honor. Let me think this over.", 'Phoenix')
          dialog("The witness knew it was a clock, because he...", 'Phoenix')
          puts "1) Went into the apartment\n2) Knew the victim"
        end
      end
      dialog("You're lying!", 'Phoenix')
      dialog("You were inside the apartment on the day of the murder!", 'Phoenix')
      dialog("Oh yeah? Prove it! Prove I went in there!", 'Sahwit')
      dialog("I'll do better than that! I can prove you were the one who killed her!", 'Phoenix')
      dialog("You struck her with the clock, and the shock of the blow triggered the clock's voice!", 'Phoenix')
      dialog("That was the sound you heard!", 'Phoenix')
      system('mpg123 -q sfx/rabble.mp3')
      system('mpg123 -q sfx/gavel.mp3')
      dialog("Order in the court!", 'Judge')
      dialog("Intruiging. Please continue, Mr. Wright.", 'Judge')
      dialog("Yes, Your Honor.", 'Phoenix')
      dialog("Mr. Sahwit.", 'Phoenix')
      dialog("The sound must have left quite an impression on you.", 'Phoenix')
      dialog("Understandable, since the murder weapon spoke just as you hit the victim!", 'Phoenix')
      dialog("That voice was burned into your mind.", 'Phoenix')
      dialog("That's why you were so certain about the time!", 'Phoenix')
      puts "Payne: OBJECTION!"
      $prev = 'Payne'
      `mpg123 -q sfx/wpobj.mp3`
      dialog("W-what's the meaning of this?!", 'Payne')
      dialog("This is all baseless conjecture!", 'Payne')
      dialog("Baseless...?", 'Phoenix')
      dialog("Just look at the witness's face!", 'Phoenix')
      puts "\nMr. Sahwit looks positively murderous."
      dialog("Ngh... grrah!", 'Sahwit')
      dialog("Would the witness care to elaborate?", 'Judge')
      dialog("Did you strike the victim with the clock?", 'Judge')
      dialog("I... I...! That... That day... I... I never!", 'Sahwit')
      cutscene("Look... I... The clock... I heard, no! I mean, I saw...Saw... nggg!\n", 'Sahwit')
      cutscene("Gwaaaaaaaaaaah!\n", 'Sahwit', [], 0.02)
      puts "\nMr. Sahwit throws his wig in your face."
      dialog("Shutupshutupshutup! I hate you!", 'Sahwit')
      dialog("I-it was him, I tell you! I saw him!", 'Sahwit')
      dialog("H-he killed her and he should burn! Burn! Give him death!", 'Sahwit')
      system('mpg123 -q sfx/rabble.mp3')
      system('mpg123 -q sfx/gavel.mp3')
      dialog("Order! Order in the court I say!", 'Judge')
      dialog("Your Honor, a-a moment please.", 'Payne')
      dialog("There isn't a shred of evidence supporting the defense's claims!", 'Payne')
      dialog("Mr. Wright!", 'Judge')
      dialog("Your Honor?", 'Phoenix')
      dialog("You claim the sound the witness heard came from the clock...", 'Judge')
      dialog("Do you have any evidence?", 'Judge')
      dialog("(The whole case is riding on this! I'd better think it through carefully!)".blue, 'Phoenix')
      dialog("Yes, Your Honor.", 'Phoenix')
      dialog("The sound Mr. Sahwit heard was definitely this clock.", 'Phoenix')
      dialog("A fact which is clear if you simply...", 'Phoenix')
      puts "1) Examine the batteries\n2) Ask the neighbours\n3) Try sounding the clock"
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
          dialog("All you have to do is examine the batteries!", 'Phoenix')
          dialog("Indeed? The batteries are... in the right way. The clock seems to be working fine.", 'Judge')
          dialog("What exactly did you mean, Mr. Wright?", 'Judge')
          dialog("Yes, the clock was working fine!", 'Phoenix')
          dialog("Yes, and...?", 'Payne')
          dialog('...', 'Phoenix')
          dialog("Umm, I'm sorry, I think I got confused back there with all those testimonies.", 'Phoenix')
          dialog("Mr. Wright!", 'Judge')
          dialog("I expect more from a lawyer in this court. Even if it is your first day.", 'Judge')
          dialog("I'm afraid I'll have to penalize you! Try to think things through more carefully.", 'Judge')
          penalize
          dialog("Y-Yes, Your Honor. As I was saying...", 'Phoenix')
          dialog("(The whole case is riding on this! I'd better think it through carefully!)".blue, 'Phoenix')
          dialog("Yes, Your Honor.", 'Phoenix')
          dialog("The sound Mr. Sahwit heard was definitely this clock.", 'Phoenix')
          dialog("A fact which is clear if you simply...", 'Phoenix')
          puts "1) Examine the batteries\n2) Ask the neighbours\n3) Try sounding the clock"
        elsif answer == '2' or answer == '2)'
          dialog("All you have to do is ask the victim's neighbours!", 'Phoenix')
          dialog("Talk to the neighbors...?", 'Judge')
          dialog("I'm sure one of them heard the clock tell the time when the incident occurred!", 'Phoenix')
          dialog("I see...", 'Judge')
          dialog("Does the prosecution have anything to say, Mr. Payne?", 'Judge')
          dialog("We have already made all the necessary inquiries.", 'Payne')
          dialog("Everyone living near the victim's apartment was out at the time of the murder.", 'Payne')
          dialog("Furthermore, even if a neighbor had heard the clock,", 'Payne')
          dialog("That would not prove that Mr. Sahwit heard anything.", 'Payne')
          dialog("Hmm... that is true.", 'Judge')
          dialog("I believe you may be wrong, Mr. Wright.", 'Judge')
          dialog("You'll recieve a penalty for that, unfortunately.", 'Judge')
          penalize
          dialog("I-I'm so sorry, Your Honor! Let me think about it again!", 'Phoenix')
          dialog("(The whole case is riding on this! I'd better think it through carefully!)".blue, 'Phoenix')
          dialog("Yes, Your Honor.", 'Phoenix')
          dialog("The sound Mr. Sahwit heard was definitely this clock.", 'Phoenix')
          dialog("A fact which is clear if you simply...", 'Phoenix')
          puts "1) Examine the batteries\n2) Ask the neighbours\n3) Try sounding the clock"
        end
      end
      dialog("Let's sound the clock now, here in this court.", 'Phoenix')
      dialog("Your Honor, may I have the clock?", 'Phoenix')
      dialog("I ask the court to listen very carefully...", 'Phoenix')
      dialog("...*beep*...".red, 'Alarm Clock')
      time = Time.now
      #dialog("[I think it's ".green + ((time.hour-3) % 12).to_s.green + ":".green + time.min.to_s.green + (time.hour-3 > 12 ? "PM." : "AM.").green + "]".green, 'Alarm Clock')
      dialog("[I think it's 8:25.]".green, 'Alarm Clock')
      dialog("That certainly is a strange way to announce the time.", 'Judge')
      dialog('Well, he is "The Thinker," after all.', 'Phoenix')
      dialog("So, we've heard the clock. What are your conclusions, Mr. Wright?", 'Judge')
      dialog("Mr. Payne... can you tell me what time it is now?", 'Phoenix')
      #dialog("It's " + (Time.now.hour % 12).to_s + ':' + Time.now.min.to_s + (Time.now.hour > 12 ? "PM." : "AM."), 'Payne')
      dialog("It's 11:25...", 'Payne')
      dialog("Ack!", 'Payne')
      dialog("As you can see, this clock is exactly three hours slow!", 'Phoenix')
      dialog("Precisely the discrepancy between what Mr. Sahwit heard and the actual time of death!", 'Phoenix')
      dialog("So, Mr. Sahwit...", 'Phoenix')
      dialog("Try to talk your way out of this one!", 'Phoenix')
      dialog("...", 'Sahwit')
      dialog("...Hah! Hah hah!", 'Sahwit')
      dialog("You forgot one thing!", 'Sahwit')
      dialog("(Uh oh... what's he talking about...?)".blue, 'Phoenix')
      dialog("While it might seem like that clock IS running three hours slow...", 'Sahwit')
      dialog("It proves nothing!", 'Sahwit')
      dialog("How do you know it was running slow " + "on the day of the murder".red + "?!", 'Sahwit')
      dialog("If you can't prove that, you don't have a case!", 'Sahwit')
      dialog("...!", 'Phoenix')
      dialog("(He's right! How am I going to prove that?!)".blue, 'Phoenix')
      dialog("(Dammit! I was so close!)".blue, 'Phoenix')
      dialog("Mr. Wright?", 'Judge')
      dialog("It seems you lack the critical evidence to support your claim.", 'Judge')
      dialog("...!", 'Phoenix')
      dialog("Yes, Your Honor.", 'Phoenix')
      dialog("This means I cannot let you indict the witness.", 'Judge')
      dialog("Unfortunately...", 'Judge')
      system('mpg123 -q sfx/gavel.mp3')
      dialog("This ends the cross-examination of Frank Sahwit.", 'Judge')
      dialog("I come all the way down here to testify, and look what happens!", 'Sahwit')
      dialog("They treat me like a criminal! A criminal!", 'Sahwit')
      dialog("You lawyers are all slime!", 'Sahwit')
      dialog("(Grr! I almost had him...)".blue, 'Phoenix')
      dialog("(Sorry, Larry... I failed you.)".blue, 'Phoenix')
      dialog("(There's nothing I can do about it now...)".blue, 'Phoenix')
      sleep(0.5)
      dialog("Not so fast, Mr. Sahwit!", 'Mia')
      dialog("Mia! I mean, Chief!", 'Phoenix')
      dialog("Listen up, Wright!", 'Mia')
      dialog("Don't throw this one away, not like this! Think!", 'Mia')
      dialog("But, Chief, it's over!", 'Phoenix')
      dialog("I can't prove the clock was slow on the day of the murder!", 'Phoenix')
      dialog("Nobody can prove that!", 'Phoenix')
      dialog("Umm... well, yes.", 'Mia')
      dialog("But that doesn't mean you can't still win! Try thinking out of the box!", 'Mia')
      dialog("Don't waste time doubting the facts. Assume the clock was three hours slow and...", 'Mia')
      dialog("Think through it!", 'Mia')
      dialog("Ask yourself, " '"Why was the clock three hours slow"'.red + "?", 'Mia')
      dialog("Figure out the reason, and you'll have your proof!", 'Mia')
      dialog("Right, Wright?", 'Mia')
      dialog("Can you think of a reason as to why the clock was three hours slow?", 'Mia')
      puts "[y/n]"
      print '> '
      until (answer = gets.chomp.downcase) == 'y' or answer == 'n'
        if answer == 'cr' or answer.gsub(/ /, "") == 'courtrecord'
          disp_cr
        elsif answer == 'pf' or answer == 'profiles'
          disp_pf
        elsif answer =~ /^check /i
          check answer.split(' ')[1..-1].join(' ')
        end
        print '> '
      end
      if answer == 'y'
        dialog('...', 'Phoenix')
        dialog('Wait!', 'Phoenix')
        dialog("Maybe I can prove it!", 'Phoenix')
        dialog("You must have evidence somewhere that can prove it, Wright!", 'Mia')
        dialog("Find it and let them have it!", 'Mia')
        dialog("Well, Mr. Wright?", 'Judge')
        dialog("You say the clock was already running slow on the day of the murder...", 'Judge')
        dialog("Have you found evidence to support this claim?", 'Judge')
        dialog("Of course.", 'Phoenix')
        dialog("There is a piece of evidence in the Court Record that can prove my claim beyond a doubt!", 'Phoenix')
        dialog("Hah! Tough words! Let's see you pull this one off!", 'Sahwit')
      else
        dialog("H-How am I supposed to know that?!", 'Phoenix')
        dialog("I know you can figure it out!", 'Mia')
        dialog("There must be some evidence in the Court Record...", 'Mia')
        dialog("Something that can show why the clock was running three hours slow!", 'Mia')
        dialog("Find it, and he won't have a foot to stand on!", 'Mia')
        dialog("Mr. Wright?", 'Judge')
        dialog("Y-y-yes, Your Honor!", 'Phoenix', [1, 3])
        dialog("You say the clock was already running slow on the day of the murder...", 'Judge')
        dialog("Do you have evidence to prove this?", 'Judge')
        dialog(p="(This is it... all or nothing!)".blue, 'Phoenix')
        dialog("Yes, Your Honor.", 'Phoenix')
        dialog("I believe I have the evidence that can prove my claim!", 'Phoenix')
        dialog("Hah hah! I'd like to see THAT!", 'Sahwit')
      end
      dialog("Let's see this evidence that proves why the clock was running slow!", 'Judge')
      puts "Present evidence by typing 'present'."
      while true
        print '> '
        answer = gets.chomp
        if answer.downcase == 'cr' or answer.downcase.gsub(/ /, "") == 'courtrecord'
          disp_cr
        elsif answer.downcase == 'pf' or answer.downcase == 'profiles'
          disp_pf
        elsif answer =~ /^check /i
          check answer.split(' ')[1..-1].join(' ')
        elsif answer =~ /^present /i
          puts "Phoenix: TAKE THAT!"
          $prev = 'Phoenix'
          `mpg123 -q sfx/pwtt.mp3`
          name = answer.split[1..-1].join ' '
          ev = $cr.select {|x| x.name.downcase.include? name.downcase}[0]
          if ev.nil?
            puts "Unknown evidence: #{name}"
          else
            unless ev.name == 'Passport'
              dialog("Um, excuse me. This proves your claim... how?", 'Judge')
              dialog("I can't see what that evidence has to do with the clock.", 'Judge')
              dialog("(D'oh! That wasn't it!)".blue, 'Phoenix')
              dialog("One more chance... Give me just one more chance!", 'Phoenix')
              dialog("Alright, Mr. Wright, but time is not on your side.", 'Judge')
              dialog("Be quick about it.", 'Judge')
              dialog("Let's see this evidence that proves why the clock was running slow!", 'Judge')
            else
              break
            end
          end
        end
      end
      dialog("The victim had just returned home from abroad the day before the murder.", 'Phoenix')
      dialog("As we all know, the time difference between Paris and here is nine hours!", 'Phoenix')
      dialog("When it's 4:00 PM here, it's 1:00 AM the next day there.", 'Phoenix')
      dialog("The clock wasn't three hours slow, it was nine hours fast!", 'Phoenix')
      dialog("The victim hadn't reset her clock since returning home!", 'Phoenix')
      dialog("That's why the time you heard when you struck her dead in her apartment was wrong!", 'Phoenix')
      dialog("Proof enough for you, Mr. Sahwit? Or should I say... Mr. Did It!", 'Phoenix')
      cutscene("Ngh! ...!", 'Sahwit')
      puts "\nMr. Sahwit faints from the pressure and falls to the ground at the witness stand."
      `mpg123 -q sfx/gavel.mp3`
      `mpg123 -q sfx/gavel.mp3`
      `mpg123 -q sfx/gavel.mp3`
      dialog("O-order! Order, I say!", 'Judge')
      dialog("Well...", 'Judge')
      dialog("This case has certainly turned out differently than we all expected.", 'Judge')
      dialog("Mr. Payne... your client?", 'Judge')
      dialog("He... er... he was arrested and has been taken away, Your Honor.", 'Payne')
      dialog("Very well.", 'Judge')
      dialog("Mr. Wright?", 'Judge')
      dialog("Yes, Your Honor.", 'Phoenix')
      dialog("I have to say, I'm impressed.", 'Judge')
      dialog("I don't think I've ever seen someone complete a defense so quickly...", 'Judge')
      dialog("and find the true culprit at the same time!", 'Judge')
      dialog("Thank you, Your Honor.", 'Phoenix')
      dialog("At this point, this is only a formality, but...", 'Judge')
      dialog("This court finds the defendant, Mr. Larry Butz...", 'Judge')
      dialog("Not Guilty.", 'Judge')
      `mpg123 -q sfx/notguilty.mp3`
      dialog("And with that... the court is adjourned.", 'Judge')
      clearscreen
      dialog("It turns out that Frank Sahwit was a common burglar!", 'Phoenix')
      dialog("He posed as a newspaper salesman to check and see when people were out of their house!", 'Phoenix')
      dialog("That day...", 'Phoenix')
      dialog("When Larry went to her apartment, the victim wasn't home.", 'Phoenix')
      dialog("After he left, Mr. Sahwit let himself in to do his dirty work!", 'Phoenix')
      dialog("While he was searching her place, the victim returned!", 'Phoenix')
      dialog("Flustered, Mr. Sahwit grabbed the nearest blunt object he could find...", 'Phoenix')
      clearscreen
      dialog(p = "August 3, 2:32 PM\nDistrict Court\nDefendant Lobby No. 2".green.bold, '', (0..p.length).to_a.select {|x| p[x] == "\n"}, 0.1, 0.3)
      dialog("(Whew, I still can't believe we won!)".blue, 'Phoenix')
      dialog("Wright! Good job in there!", 'Mia')
      dialog("Congratulations!", 'Mia')
      dialog("Th-thanks, Chief. I owe it all to you.", 'Phoenix', [2])
      dialog("Not at all, not at all! You fought your own battles in there.", 'Mia')
      dialog("It's been a while since I've seen a trial end on such a satisfying note!", 'Mia')
      dialog("(I've never seen the Chief looking this happy...)".blue, 'Phoenix')
      dialog("(If she's this glad, imagine how Larry must feel!)".blue, 'Phoenix')
      dialog("My life is over...", 'Butz')
      dialog("Larry! You're supposed to be happy! What's wrong now?", 'Phoenix')
      dialog("Aww, Nick...", 'Butz')
      dialog("Don't worry 'bout me! I'll be dead and gone soon!", 'Butz')
      dialog("Good! Wait, no! I mean... Bad! Bad bad bad!", 'Phoenix')
      dialog("Larry, you're innocent! The case is closed.", 'Phoenix')
      dialog('...', 'Butz')
      dialog("But... but my Cindy-windy's gone, man! Gone forever!", 'Butz')
      dialog("(Larry, she was a... Nah... Never mind.)".blue, 'Phoenix')
      dialog("Congratulations, Harry!", 'Mia')
      dialog("H-Harry...?", 'Butz')
      dialog('Yes, you! I can practically see the headlines now: "Harry Butz, Innocent!"', 'Mia')
      dialog("Heh... um... thanks! I really owe you one.", 'Butz')
      dialog("I won't forget this, ever! Let's celebrate! Dinner? Movie? My treat!", 'Butz')
      dialog("Oh, no, I couldn't.", 'Mia')
      dialog("(Hey, I was the one who got you off the hook!)".blue, 'Phoenix')
      dialog('Oh, hey!', 'Butz')
      puts "Larry holds out the statue of The Thinker.\n\n"
      dialog("H-here, take this! It's a present!", 'Butz')
      dialog("A present? For me?", 'Mia')
      dialog("Wait... Wasn't this the evidence that...", 'Mia')
      dialog("Actually, I made this clock for her!", 'Butz')
      dialog("I made one for her and one for me.", 'Butz')
      dialog("R-Really? You? You made this?", 'Mia')
      dialog('...', 'Mia')
      dialog("Well, thank you. I'll keep it as a memento.", 'Mia')
      dialog("Yo, Nick...", 'Butz')
      dialog("Can you believe it? I was so into that chick...", 'Butz')
      dialog("And... and she was just playing me for a fool!", 'Butz')
      dialog("Don't that make you wanna just cry? *sob*", 'Butz')
      dialog("Larry...", 'Phoenix')
      dialog('...', 'Mia')
      dialog("Are you so sure?", 'Mia')
      dialog("Ex-queeze me?", 'Butz')
      dialog("I think she thought quite a lot of you, in her own way.", 'Mia')
      dialog("Nah, you don't gotta sympathize with me, 'sokay.", 'Butz')
      dialog("Oh, I'm not just sympathizing, really.", 'Mia')
      dialog("Isn't that right, Wright? Don't you have something to show your friend?", 'Mia')
      dialog("Something that proves how she felt about him?", 'Mia')
      dialog("H-huh? Oh, yeah, right!", 'Phoenix')
      dialog("(What the heck is she talking about?)".blue, 'Phoenix')
      puts "Present evidence by typing 'present'."
      while true
        print '> '
        answer = gets.chomp
        if answer.downcase == 'cr' or answer.downcase.gsub(/ /, "") == 'courtrecord'
          disp_cr
        elsif answer.downcase == 'pf' or answer.downcase == 'profiles'
          disp_pf
        elsif answer =~ /^check /i
          check answer.split(' ')[1..-1].join(' ')
        elsif answer =~ /^present /i
          puts "Phoenix: TAKE THAT!"
          $prev = 'Phoenix'
          `mpg123 -q sfx/pwtt.mp3`
          name = answer.split[1..-1].join ' '
          ev = $cr.select {|x| x.name.downcase.include? name.downcase}[0]
          if ev.nil?
            puts "Unknown evidence: #{name}"
          else
            unless ev.name == 'Statue'
              dialog("Here you go, Larry. Proof.", 'Phoenix')
              dialog("...", 'Butz')
              dialog("Eh... heh heh? It's okay, Nick. Don't worry about me.", 'Butz')
              dialog("I'll forget about her soon enough.", 'Butz')
              dialog("Look, I'm gonna head home. Thanks a ton, eh?", 'Butz')
              dialog("(Guess that wasn't the right thing to show him...)".blue, 'Phoenix')
              break
            else
              dialog("Check this out, Larry. Proof Positive you weren't just some chump to her.", 'Phoenix')
              dialog("Huh...? Where'd you get that clock?", 'Butz')
              dialog("This is the clock you made for her, Larry!", 'Phoenix')
              dialog("She took it with her when she traveled.", 'Phoenix')
              dialog("Hmm, she probably just needed a clock, that's all.", 'Butz')
              dialog("You think so? It's a pretty heavy clock to take traveling.", 'Phoenix')
              dialog('...', 'Butz')
              dialog("Well, make of it what you will.", 'Phoenix')
              dialog('...', 'Butz')
              dialog("Hey, Nick.", 'Butz')
              dialog("I'm glad I asked you to be my lawyer.", 'Butz')
              dialog('Really, I am. Thanks.', 'Butz')
              dialog("(Hope that made him feel a little better...)".blue, 'Phoenix')
              break
            end
          end
        end
      end
      dialog("Wright?", 'Mia')
      dialog("I hope you see the importance of evidence now.", 'Mia')
      dialog("Also, hopefully you realize, things change depending on how you look at them.", 'Mia')
      dialog("People, too.", 'Mia')
      dialog("We never really know if our clients are innocent or guilty.", 'Mia')
      dialog("All we can do is believe in them.", 'Mia')
      dialog("And in order to believe in them, you have to believe in yourself.", 'Mia')
      dialog("Wright...", 'Mia')
      dialog("Listen. Learn. Grow strong.", 'Mia')
      dialog("Never let go of what you believe in. Never.", 'Mia')
      puts
      dialog("Well, I believe our work here is done! Shall we be off?", 'Mia')
      dialog("Yeah, I guess so!", 'Phoenix')
      dialog("Say, how about dinner. On me?", 'Mia')
      dialog("We'll drink a toast to innocent Butz!", 'Mia')
      dialog("Yeah!", 'Phoenix')
      dialog("Oh, speaking of Harry...", 'Mia')
      dialog("You were saying part of why you became a lawyer was because of him.", 'Mia')
      dialog("Er, yeah. Part, at least.", 'Phoenix')
      dialog("You'll have to tell me more about it sometime! Maybe... over drinks?", 'Mia')
      clearscreen
      dialog("And so, my first trial came to a close.", 'Phoenix')
      dialog("Larry slapped me on the back and said, \"Gee, Nick, it's good to have friends!\"", 'Phoenix')
      dialog("But I'm pretty sure he's not going to pay me. Unless you count the clock he gave to Mia.", 'Phoenix')
      dialog('...', 'Phoenix')
      dialog("I didn't know it then...", 'Phoenix')
      dialog("but that clock was soon going to be at the center of another incident.", 'Phoenix')
      dialog("And my promise to tell the chief about me and Larry...", 'Phoenix')
      dialog("would be one promise that I wouldn't be able to keep.", 'Phoenix')
      puts "THE END."
      puts "A new episode has been added: Turnabout Sisters."
      $episodes.transaction { $episodes[:eps] = 2 unless $episodes[:eps] > 2 }
  end
end
unless __FILE__ == $0
  $save = PStore.new('first.pstore')
  if $save.transaction { $save[:part] }.nil? or not $save.transaction { $save[:part] }.is_a? Numeric
    $save.transaction { $save[:part] = 1 }
  end
  part($save.transaction { $save[:part] })
end
