/* =====================================================

		MAIN QUEST STARTS HERE

			Athkatla

===================================================== */

// Athkatla, the Promenade, the frightened boy

BEGIN O#LLBOY
APPEND O#LLBOY

IF ~True()~ l1
SAY @0 /* Don't hurt me! Please, d-don't take out my heart and crush it! */ 
++ @1 /* Why would I even want to do so? */ + l1.1
++ @2 /* Um... all right. */ + l1.1
++ @3 /* Oh, I shall be pleased to carve out your heart. What do you want? */ + l1.1
END

IF ~~ l1.1
SAY @4 /* There's a drow elf in Enge's shop, over by the second t-tier. A real drow! He said you'd crush my heart if I don't d-deliver this message. Here, take it! */
++ @5 /* Really. Where is this drow, you say? */ + l1.2
++ @6 /* Don't worry, boy, I'll deal with this drow. */ + l1.2
++ @7 /* Very good. Now, as I promised, I shall take out your heart. Myahaha! */ + l1.3
END

IF ~~ l1.2
SAY @8 /* Just go over to Enge's shop. The d-drow is inside. */
IF ~~ DO ~GiveItemCreate("O#LLNot1",Player1,1,0,0) AddJournalEntry(@10000,QUEST) EscapeArea()~ EXIT
END

IF ~~ l1.3
SAY @9 /* Eeek! */
IF ~~ DO ~GiveItemCreate("O#LLNot1",Player1,1,0,0) AddJournalEntry(@10000,QUEST) EscapeArea()~ EXIT
END
END

// Enge's shop: Enge

EXTEND_BOTTOM SHOP04 0
+ ~GlobalGT("O#LLQuest","GLOBAL",0)~ + @10 /* Do you have any business with the drow? */ + e0
+ ~GlobalGT("O#LLQuest","GLOBAL",0)~ + @11 /* Did you even notice a drow elf in your shop? */ + e1
END

EXTEND_BOTTOM SHOP04 1
+ ~GlobalGT("O#LLQuest","GLOBAL",0)~ + @10 /* Do you have any business with the drow? */ + e0
+ ~GlobalGT("O#LLQuest","GLOBAL",0)~ + @11 /* Did you even notice a drow elf in your shop? */ + e1
END

CHAIN SHOP04 e0
@12 /* Always good business, no? Had a strange elf comink here for avocado once, I zink. Vuld you vant some? */
EXIT

CHAIN SHOP04 e1
@13 /* Drow? Zis drow, zat drow? Many strange peoples, each buyink somezink! Be buyink my mango, yes? */
EXIT

// The drow messenger

BEGIN O#LLMESS

CHAIN O#LLMESS m1.1
@14 /* You met Jarlaxle in Ust Natha, no? He was... is our leader. He created Bregan D'aerthe, Menzoberranzan's most fearsome mercenary band, from nothing. Now he and his top lieutenant, Kimmuriel Oblodra, wield more power than many of the Matron Mothers. */
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @15 /* I have heard of this band, <CHARNAME>. The rumor goes they are interested in profit alone. Should something go amiss, they will betray you all too easily. */
== IMOEN2J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @16 /* I do not like this Bregan D'aerthe, <CHARNAME>. Not one bit. */
== KORGANJ IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @17 /* Har! I say this is where we agree to work with this drow scum, introduce their gullets to me axe, and leave with the damn trinkets. */
== KELDORJ IF ~InParty("Keldorn")InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @18 /* Weigh your choices carefully, my friend. Last time you had to work with unsavory allies, your sister's life was at risk. Is it worth it to walk this dark path again? */
== VALYGARJ IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN @19 /* Mercenaries. Mages and dark sorcerers among them, I don't doubt. To the Nine Hells with them. */
== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @20 /* We're... we're not going back there, <CHARNAME>? To the Underdark? */
== O#LLMESS @21 /* There is a task that Kimmuriel needs some... assistance with. If you wish to work with us in this matter, Bhaalspawn, I have been told to bring you to him. */
END
++ @22 /* Why would a drow need a surfacer's assistance? */ EXTERN O#LLMESS m1.5
++ @23 /* Bring me where, straight to Menzoberranzan? */ EXTERN O#LLMESS m1.6
++ @24 /* Very well, where is this Kimmuriel? */ EXTERN O#LLMESS m1.6
+ ~Global("JarlaxleHQ","GLOBAL",0)~ + @1130 /* I actually never met Jarlaxle in Ust Natha. */ EXTERN O#LLMESS m1.5a

APPEND O#LLMESS

IF ~Global("O#LLQuest","GLOBAL",1)~ m1
SAY @25 /* You are here. Good, it means my task is nearly complete. */ 
IF ~~ DO ~EraseJournalEntry(@10000)
SetGlobal("O#LLQuest","GLOBAL",2)~ + m1.0
END

IF ~~ m1.0
SAY @26 /* My superiors have a proposal for you. But first, I have been instructed to ask you a question: are you willing to work with Bregan D'aerthe? */
++ @27 /* With that pack of mercenaries and liars? Never in my life! */ + m1.2
++ @28 /* With Jarlaxle leading them, they are no better than the Shadow Thieves. */ + m1.2
++ @29 /* Work with who? */ + m1.1a
++ @30 /* Never heard of him. Or is it a she? */ + m1.1b
++ @31 /* Sure, what's the difference? Liches, vampires, drow - as long as the reward is good. */ + m1.1
END

IF ~~ m1.1a
SAY @32 /* Bregan D'aerthe is a mercenary organization. You will meet our current leader shortly. */
IF ~~ + m1.1c
END

IF ~~ m1.1b
SAY @33 /* Bregan D'aerthe is not a person, Bhaalspawn. It is a mercenary organization. */
IF ~~ + m1.1c
END

IF ~~ m1.1c
SAY @34 /* We are warriors, rogues, and mages united in striving for survival and profit by whatever means necessary. And we are offering you a job. */
++ @35 /* I don't like this idea much. Working with you might mean some nefarious things. */ + m1.2
++ @36 /* Sure, why not? Adventure is adventure. */ + m1.1
END

IF ~~ m1.2
SAY @37 /* Is this your final answer? */
++ @38 /* Absolutely. And if you see Jarlaxle, tell him I'll kill him myself. */ + m1.sui
++ @39 /* Why? What happens if I refuse? You'll go to Jarlaxle? */ + m1.sui
++ @40 /* Let's say I'm willing to work with them. What then? */+ m1.1
END

IF ~~ m1.sui
SAY @41 /* I cannot tell Jarlaxle anything because... but it is not your business anymore. Very well. I suppose my life is forfeit now. I might as well kill myself. */
++ @42 /* And here I thought Xan was depressing. Why in the Nine Hells would you do this? */ + m1.3
++ @43 /* Kill yourself? Because I refused to work for Bregan D'aerthe? */ + m1.3
++ @44 /* Wait. You can't tell Jarlaxle anything? Why? */ + m1.3
++ @45 /* Right. Just do it somewhere out of sight, please. */ + m1.4
END

IF ~~ m1.3
SAY @46 /* Bregan D'aerthe needs your help, Bhaalspawn. I cannot acquire a worthy ally, hence I am of no value to Kimmuriel. He will dispose of me as soon as he has an opportunity. */
++ @47 /* I see. Well, let's say I agree to work with you. Tell me more. */ + m1.1
++ @48 /* Too bad for you. Goodbye. */ + m1.4
END

IF ~~ m1.4
SAY @49 /* Goodbye, Bhaalspawn. You shall not hear from us again. */
IF ~~ DO ~SetGlobal("O#LLQuest","GLOBAL",999)
AddJournalEntry(@9999,QUEST_DONE)
ApplySpell("O#LLMESS",DRYAD_TELEPORT)~ EXIT
END

IF ~~ m1.5
SAY @50 /* I know little of how Kimmuriel's mind works. And if I were you, I wouldn't delve too deeply into it either. */
IF ~~ + m1.6
END

IF ~~ m1.5a
SAY @1131 /* But you know more than enough about him now. Kimmuriel may tell you more. Then again, he may not. */
IF ~~ + m1.6
END

IF ~~ m1.6
SAY @51 /* Kimmuriel will wait for you under what you call the Temple District of this city. Strange that none of you worship the Queen... but no matter. */
IF ~~ DO ~AddJournalEntry(@10001,QUEST)~ + m1.6a
END

IF ~~ m1.6a
SAY @52 /* Would you prefer to find Kimmuriel yourself, or should I teleport you? Once you meet him, there is no going back. */
++ @53 /* No, don't bother. I will find him myself. */ + m1.well
++ @54 /* Teleport me. */ + m1.8
++ @55 /* I'll need you to teleport me later. I have things to do in the Promenade. */ + m1.well
++ @56 /* First the boy, then you, then another drow. If this Kimmuriel of yours sends me to the Copper Coronet to look for someone else, I'll sacrifice him to Lolth just for the sake of it. */ + m1.7
++ @57 /* I have all I need. Now it is time for you to die, worthless drow! */ + m1.fight
END

IF ~~ m1.7
SAY @58 /* Many others said these words before, surfacer. None succeeded. */
IF ~~ + m1.fin
END

IF ~~ m1.8
SAY @59 /* It will be done. Prepare yourself. */
IF ~~ DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("O#LLCut1")~ EXIT
END

IF ~~ m1.well
SAY @60 /* Very well. Our business is concluded, unless you have questions. */
IF ~~ + m1.fin
END

IF ~~ m1.fin
SAY @61 /* Is there something else you wish to ask? */
++ @62 /* Your manner seems subdued. Why is that? */ + m1.slave
++ @63 /* You told a little boy I would crush his heart! */ + m1.boy
++ @64 /* What exactly does Kimmuriel need help with? */ + m1.matter
++ @65 /* Teleport me to Kimmuriel right now. */ + m1.8
++ @66 /* No, nothing. I should go. */ + m1.go
++ @67 /* Actually, I've decided to kill you. */ + m1.fight
END

IF ~~ m1.fight
SAY @68 /* I see. Kimmuriel will be pleased. You are truly his champion! */
IF ~~ DO ~Enemy()~ EXIT
END

IF ~~ m1.matter
SAY @69 /* This is not for me to say. If I reveal what I know, my punishment will be swift. */
= @70 /* I shall say only this. Do not lie to him. He will see through you. */
IF ~~ + m1.fin
END

IF ~~ m1.slave
SAY @71 /* If you must know, surfacer, it is because my house has fallen scant days ago. Jarlaxle of Bregan D'aerthe saved my life and took me in. I do not know what he saw in me. My magic is hardly remarkable. */
= @72 /* In the Underdark, I am no better than a slave. Jarlaxle's lieutenant thinks me useless and wants me dead. Jarlaxle is the only one keeping me alive. As for the rest of my reasons... you shall know shortly. */
IF ~~ + m1.fin
END

IF ~~ m1.boy
SAY @73 /* A threat familiar to each Menzoberranyr whelp and just as common. Why? Do you surfacers do things differently? */
++ @74 /* Yes, we do. */ + m1.good
++ @75 /* Couldn't you give him a couple of coins or just ask him nicely? */ + m1.bad
++ @76 /* Maybe not. Still, you shouldn't have threatened the child! */ + m1.bad
END

IF ~~ m1.good
SAY @77 /* Strange. But that is the surface for you. */
IF ~~ + m1.fin
END

IF ~~ m1.bad
SAY @78 /* And then my note wouldn't be delivered. You would never come, and Kimmuriel Oblodra would flay me with his mind. I think I know which is preferable. */
IF ~~ + m1.fin
END

IF ~~ m1.go
SAY @79 /* Goodbye, Bhaalspawn. I still have a few errands to run here for Bregan D'aerthe. Perhaps we shall meet again. */
IF ~~ EXIT
END

IF ~GlobalGT("O#LLQuest","GLOBAL",1) GlobalLT("O#LLQuest","GLOBAL",100)~ m2
SAY @80 /* You are back. */ 
IF ~~ + m1.fin
END

IF ~Global("O#LLQuest","GLOBAL",1000)~ m4
SAY @81 /* I heard that you failed in your task. I have nothing else to say to you, surfacer. */ 
IF ~~ DO ~ApplySpell("O#LLMESS",DRYAD_TELEPORT)~ EXIT
END

IF ~Global("O#LLQuest","GLOBAL",100)~ m3
SAY @82 /* I heard that Jarlaxle escaped thanks to you and that assassin, Artemis Entreri. Why would the leader of Bregan D'aerthe choose roaming the surface with a human? I will never understand this. */ 
++ @83 /* The surface is great. You should try roaming it, too. */ + m3.1
++ @84 /* Is Kimmuriel still intent on killing you? I could put in a good word. */ + m3.2
++ @85 /* True, Menzoberranzan has its charms. I only wish I could see more of it. */ + m3.3
END

IF ~~ m3.1
SAY @86 /* No, I shall be glad to leave this place. You surfacers do not understand how dangerous this sunlight of yours can be. Survival lies in the shadows. */
IF ~~ + m3.4
END

IF ~~ m3.2
SAY @87 /* No need, surfacer. I have proven my worth, thanks to you. At least for now. There is always more treachery around the corner. Such is life in Menzoberranzan. */
IF ~~ + m3.4
END

IF ~~ m3.3
SAY @88 /* You still could, but you wouldn't like it. There may be thirty thousand drow in Menzoberranzan, but you, <PRO_RACE>, will always be ranked the thirty thousand and first. */
IF ~~ + m3.4
END

IF ~~ m3.4
SAY @89 /* It is time for me to return home. Walk well, surfacer. And if you wish to do Bregan D'aerthe a favor, do not pester Enge about our... alliance. */
IF ~~ DO ~ApplySpell("O#LLMESS",DRYAD_TELEPORT)~ EXIT
END
END

/* =====================================================

		Temple sewers: Kimmuriel

===================================================== */

BEGIN O#LLKIMM

CHAIN IF WEIGHT #-1 ~Global("O#LLQuest","GLOBAL",3)~ THEN PLAYER1 p1
@90 /* A strange feeling envelops your senses, a feeling which you once experienced in the depths of the Underdark caverns, where mind flayers subdue their prey with uncanny powers. */
END
IF ~~ DO ~SetGlobal("O#LLQuest","GLOBAL",4)~ EXTERN PLAYER1 p1.0

CHAIN PLAYER1 p1.0
@91 /* You are not in the Underdark now, yet the feeling is intimately familiar. Someone is trying to probe your mind. */
END
++ @92 /* Stop this, whoever you are. */ EXTERN PLAYER1 p1.1
++ @93 /* I feel what you're trying to do. Show yourself. */ EXTERN PLAYER1 p1.1
++ @94 /* Kimmuriel Oblodra? We have business to discuss. */ EXTERN PLAYER1 p1.1

CHAIN PLAYER1 p1.1
@95 /* The alien touch lingers for a few moments, then reluctantly disappears. Your mind is your own, for now. */
EXIT

CHAIN IF ~Global("O#LLQuest","GLOBAL",5)~ THEN O#LLKIMM k1
@96 /* There is residual magic on you, traces of an enchantment that still holds. Until I touched your mind, I was not sure who I was looking at. */ 
== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @97 /* This is your excuse for entering <CHARNAME>'s mind? Some leftover vestiges of the spell cast by Adalon? Bah. Even slack-jawed apprentices from the Thaymount Academy try better. */
== JANJ IF ~InParty("Jan") InMyArea("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN @98 /* Ahh, so the wise lady dragon left us something to remember her by. I wonder if my kids will have white hair? Ebony ears, maybe? You know, it reminds me of my aunt Belinda Jansen. She hated drow, but wanted to befriend one just to tell him how much she hated his race. Met a Dark Maiden follower by accident, if you can call getting drunk and dancing naked under the stars such. I hear they're expecting their firstborn now. */
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @99 /* So Adalon's spell still lingers on you, <CHARNAME>. Perhaps the drow is correct, but trust him not. We learnt well in Ust Natha that amongst the drow, deception is everywhere. */
== MINSCJ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @100 /* It cannot be! The good silver dragon cursed Minsc and Boo with a small piece of the drow disguise forever! How will Minsc bathe? What if Boo's whiskers or Minsc's backside... all right, Boo, I understand. I will stop now. */
== MAZZYJ IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @101 /* Does he mean that a part of Adalon's spell will remain for a while? It will be useful in understanding the drow language. But be wary, my friend. Do not let their corruption taint you. */
== O#LLKIMM @102 /* The silver dragon's spell gave you much more than a temporary face change. You know our language, our runes, some of our customs. I even suspected you were an impostor. */ 
DO ~SetGlobal("O#LLQuest","GLOBAL",6) EraseJournalEntry(@10001)~
== O#LLKIMM @103 /* No matter. You are you, that much is clear. I am Kimmuriel Oblodra. */ 
END
++ @104 /* Did you really enter my mind? How do you do this? */ EXTERN O#LLKIMM k1.0
++ @105 /* Try to touch my mind again, and the deal's off. */ EXTERN O#LLKIMM k1.02
++ @106 /* Nice to meet you. */ EXTERN O#LLKIMM k1.1
++ @107 /* To business, then. */ EXTERN O#LLKIMM k1.1

CHAIN O#LLKIMM k1.0
@108 /* Your mind is an open book for those who can read... like me. */
END
++ @109 /* You have psionic powers. */ EXTERN O#LLKIMM k1.01
++ @110 /* And your neck is an open invitation for someone to snap it. */ EXTERN O#LLKIMM k1.02
++ @111 /* Don't do it again. */ EXTERN O#LLKIMM k1.02

CHAIN O#LLKIMM k1.01
@112 /* Correct. And you, Bhaalspawn, seem to have luck on your side, something I thought only Jarlaxle possessed. */
END
IF ~~ EXTERN O#LLKIMM k1.1

CHAIN O#LLKIMM k1.02
@113 /* Noted. And if you threaten me again... should I continue? Or is your mind capable of grasping what mine can do? */
END
IF ~~ EXTERN O#LLKIMM k1.1

CHAIN O#LLKIMM k1.1
@114 /* You've met my messenger, I see. Did he mention I would take you straight to Menzoberranzan? */
END
++ @115 /* Really? From his description, I thought we'd have a picnic in Umar Hills. */ EXTERN O#LLKIMM k1.1a
++ @116 /* Not really. He said he'd be punished if he revealed anything. */ EXTERN O#LLKIMM k1.1a
++ @117 /* The drow messenger said you would execute him if he failed. Is it true? */ EXTERN O#LLKIMM k1.1a
+ ~!Dead("O#LLMESS")~ + @118 /* You sent a weakling to convince me. I nearly killed him. */ EXTERN O#LLKIMM k1.1a
+ ~Dead("O#LLMESS")~ + @119 /* You sent a weakling to convince me. I killed him. */ EXTERN O#LLKIMM k1.1a

CHAIN O#LLKIMM k1.1a
@120 /* I sent a weakling to greet you. There was a purpose to it. Were you as foolish as most surface dwellers, you would take mercy on him and agree to the task simply to spare him from execution or kill him our of sheer annoyance. I did not care either way. */
== O#LLKIMM @121 /* But we're wasting time. The task is... Wait. Did you hear that? */
DO ~DestroySelf()~
EXIT

CHAIN IF ~Global("O#LLQuest","GLOBAL",8)~ THEN O#LLKIMM k1.2
@122 /* Trolls in the city sewers and an illithid lair nearby. Your city is more like mine than I thought. */ 
END
+ ~Global("OpenSecretDoor","AR0701",0)~ + @123 /* Wait, an illithid lair? Really? */ EXTERN O#LLKIMM k1.2a
+ ~!Global("OpenSecretDoor","AR0701",0)~ + @123 /* Wait, an illithid lair? Really? */ EXTERN O#LLKIMM k1.2b
++ @124 /* Stick around. You ain't seen nothing yet. */ EXTERN O#LLKIMM k1.3
++ @125 /* Athkatla is a strange city. */ EXTERN O#LLKIMM k1.3
++ @126 /* You left me to fend for myself! */ EXTERN O#LLKIMM k1.4

CHAIN O#LLKIMM k1.2a
@127 /* You will have ample opportunity to check my words later. */
END
IF ~~ EXTERN O#LLKIMM k1.5

CHAIN O#LLKIMM k1.2b
@128 /* Do not feign ignorance. The psionic wards are breached, and your mind has memories of breaking them. You are a more formidable ally than I have thought. */
END
IF ~~ EXTERN O#LLKIMM k1.5

CHAIN O#LLKIMM k1.3
@129 /* So I am learning, to my displeasure. */
END
IF ~~ EXTERN O#LLKIMM k1.5

CHAIN O#LLKIMM k1.4
@130 /* Did you expect me to aid you? If you are this gullible, you are going to be of little use. */
END
IF ~~ EXTERN O#LLKIMM k1.5

CHAIN O#LLKIMM k1.5
@131 /* There may be more of these creatures. Unless you summoned them to distract my attention? In that case, you've almost succeeded. */
END
++ @132 /* Are all drow this paranoid? */ EXTERN O#LLKIMM k1.5a
++ @133 /* No, it wasn't me. Let's finally get to business. */ EXTERN O#LLKIMM k1.6
++ @134 /* Just tell me about the task and teleport me wherever. I'm tired of waiting. */ EXTERN O#LLKIMM k1.6

CHAIN O#LLKIMM k1.5a
@135 /* The live ones are. Now, pay attention. */
END
IF ~~ EXTERN O#LLKIMM k1.6

CHAIN O#LLKIMM k1.6
@136 /* There is a Matron Mother who overstepped her bounds. Upon hearing of House Despana's plots, Matron Jeven decided to improve her House's standing in the same manner: by summoning demons of untold power, appeasing them and turning them on her foes. */ 
END
++ @137 /* And you want to kill this Matron Mother, I take it? */ EXTERN O#LLKIMM k1.7
++ @138 /* They never learn, do they? All right, where do I come in? */ EXTERN O#LLKIMM k1.7
++ @139 /* Sounds like fun. Why not let her, then? */ EXTERN O#LLKIMM k1.7

CHAIN O#LLKIMM k1.7
@140 /* Bregan D'aerthe does not desire Menzoberranzan destroyed, especially at the height of the trading season. */ 
= @141 /* Jarlaxle offered House Jeven his services. His task was not unlike yours in Ust Natha: to infiltrate the treasury and flee with whatever artifacts the Matron Mother was going to offer to the demons. */ 
= @142 /* Sadly, something happened. We haven't heard from him since. */ 
END
++ @143 /* Yet you don't seem very sad. */ EXTERN O#LLKIMM k1.8
++ @144 /* But aren't you the leader of Bregan D'aerthe now? Why would you need to save Jarlaxle? */ EXTERN O#LLKIMM k1.8

CHAIN O#LLKIMM k1.8
@145 /* I know Jarlaxle. Everyone who expects his demise becomes bitterly disappointed at some point or another. And he is ruthless to those who betray him. */ 
== VICONIJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @146 /* I've heard of Jarlaxle's exploits during my time in Menzoberranzan. The drow speaks truly. */
== CERNDJ IF ~InParty("Cernd") InMyArea("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN @147 /* Would you care to walk underground while Irenicus ravages the trees of Suldanessellar, <CHARNAME>? Should this dark task be more important than even your lost soul? */
== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @148 /* I see little honor in pursuing this, <CHARNAME>. But I am with you. */
== NALIAJ IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @149 /* If you want to help Jarlaxle, I shall stand by your side. But, please, think about it first. Returning to the Underdark is not a decision taken lightly.  */
== HAERDAJ IF ~InParty("Haerdalis") InMyArea("Haerdalis") !StateCheck("Haerdalis",CD_STATE_NOTVALID)~ THEN @150 /* How exciting, my raven! A chance to see the Underdark's finest city! Our eyes will feast upon it together. */
==O#LLKIMM @151 /* Matron Mother Jeven denies playing any part in Jarlaxle's disappearance. I cannot pry her mind open... for now. But as her ally, I can offer her a prize: you. */ 
==O#LLKIMM @152 /* She employs surface mercenaries from time to time, but a Child of Bhaal would be a gift beyond her wildest dreams. */ 
== O#LLKIMM IF ~InParty("Viconia")~ THEN @153 /* You have a drow in your party. That is of no consequence. An exile or not, she is just another of your companions. Everyone's eyes will be on you, especially those of the Matron Mother. */
== O#LLKIMM @154 /* Obey her, but never forget your real mission: find a way to the treasury and free Jarlaxle. I shall be nearby, as will another... friend of his. You will learn about him later. */ 
END
+ ~!Dead("c6drizz")~ + @155 /* Don't tell me it's Drizzt. I just met him. */ EXTERN O#LLKIMM k1.8b
+ ~Dead("c6drizz")~ + @156 /* Don't tell me it's Drizzt. I just killed him. */ EXTERN O#LLKIMM k1.8c
++ @157 /* All right, I am ready. */ EXTERN O#LLKIMM k1.9
++ @158 /* Serve a Matron Mother? Again? The gods must really hate me. */ EXTERN O#LLKIMM k1.9
++ @159 /* Let me think about this. */ EXTERN O#LLKIMM k1.8a

CHAIN O#LLKIMM k1.8a
@160 /* You truly are foolish, Bhaalspawn. Do you think I am giving you a choice? */
END
IF ~~ EXTERN O#LLKIMM k1.9

CHAIN O#LLKIMM k1.8b
@161 /* It is just our luck he is not with you. Last time he entered Menzoberranzan, the Time of Troubles started. */
END
IF ~~ EXTERN O#LLKIMM k1.9

CHAIN O#LLKIMM k1.8c
@162 /* Indeed? I am beginning to like you, Child of Bhaal. */
END
IF ~~ EXTERN O#LLKIMM k1.9

CHAIN O#LLKIMM k1.9
@163 /* Any questions you have you may ask later. Be warned, House Jeven is at war, and the gates to its cavern are sealed to outsiders. You will be unable to leave it, but I am sure you will find enough entertainment within. */ 
END
IF ~~ DO ~SetGlobal("O#LLQuest","GLOBAL",10)
ClearAllActions()
StartCutSceneMode()
StartCutScene("O#LLCut2")~
EXIT

/* =====================================================

		Menzoberranzan

===================================================== */

// Menzoberranzan: meeting the Matron Mother

BEGIN O#LLMATR

CHAIN IF ~Global("O#LLQuest","GLOBAL",10)~ THEN O#LLMATR k2
@164 /* The prodigal mercenary returns. What have you brought me this time, Oblodra? */  
DO ~SetGlobal("O#LLQuest","GLOBAL",11)~
== O#LLKIMM @165 /* A mercenary of no small value. The Child of Bhaal who escaped Ust Natha. */ 
== O#LLMATR @166 /* A sellsword, are you? Good. Tell me, <PRO_GIRLBOY>, do you worship the Spider Queen? */ 
END
++ @167 /* Erm... Lolth be praised? */ EXTERN O#LLMATR k2.2
++ @168 /* We worship different gods on the surface. */ EXTERN O#LLMATR k2.3
++ @169 /* If there is someone I'm going to worship, it is myself. */ EXTERN O#LLMATR k2.4
++ @170 /* Actually, I do not worship any god. */ EXTERN O#LLMATR k2.5
++ @171 /* I will worship anyone you would like me to, Matron Mother. */ EXTERN O#LLMATR k2.6
++ @172 /* Of course. Heretic gods like Vhaeraun and that Dark Maiden whore should be killed for their insolence! */ EXTERN O#LLMATR k2.7
++ @173 /* No, I don't. */ EXTERN O#LLMATR k2.1
++ @174 /* Um... Kimmuriel, help me out here! */ EXTERN O#LLKIMM k2.next

CHAIN O#LLMATR k2.1
@175 /* A straight and honest answer. I like it. */
END
IF ~~ EXTERN O#LLKIMM k2.next

CHAIN O#LLMATR k2.2
@176 /* The goddess will not grant you the gift of continued life if you offer up her name so meekly. */
END
IF ~~ EXTERN O#LLKIMM k2.next

CHAIN O#LLMATR k2.3
@177 /* I know this much. Are you taking me for a fool, <PRO_RACE>? Stating the obvious can end very badly for these fragile bones of yours. */
END
IF ~~ EXTERN O#LLKIMM k2.next

CHAIN O#LLMATR k2.4
@178 /* Ha! You'll have to get out of here alive first to harbor such designs. But I like your ambition. */
END
IF ~~ EXTERN O#LLKIMM k2.next

CHAIN O#LLMATR k2.5
@179 /* No? Let the Wall of the Faithless welcome you. It eats the drow and the surfacers alike. Ha! The good surfacer is a devoured surfacer! */
END
IF ~~ EXTERN O#LLKIMM k2.next

CHAIN O#LLMATR k2.6
@180 /* Bah! Oblodra, what have you brought me? A rotting jellyfish? */
END
IF ~~ EXTERN O#LLKIMM k2.next

CHAIN O#LLMATR k2.7
@181 /* Well said! Surfacer or not, I like <PRO_HISHER> spirit. I may even spare <PRO_HIMHER> the rods this time. */
END
IF ~~ EXTERN O#LLKIMM k2.next

CHAIN O#LLKIMM k2.next
@182 /* Does it matter? Your new toy battled Ust Natha warriors and walked out from the Underdark unscathed. */ 
== O#LLMATR @183 /* Oh, I know your own "devotion" to the Queen, my slippery psionic friend. Miss your house yet, Oblodra? Yes, I saw you wince when I used the name. Pity it lies forgotten, isn't it? */ 
== O#LLMATR @184 /* But I am done wasting time with you. The captain of my guard waits for you outside, Bhaalspawn. Do whatever he tells you, and live. */ 
DO ~AddJournalEntry(@10002,QUEST)
ApplySpell("O#LLMATR",DRYAD_TELEPORT)
ApplySpell("O#LLGUA3",DRYAD_TELEPORT)
ApplySpell("O#LLGUA4",DRYAD_TELEPORT)~
EXIT

/* =====================================================

	Kimmuriel's main conversation tree

===================================================== */

CHAIN IF ~GlobalGT("O#LLQuest","GLOBAL",10) GlobalLT("O#LLQuest","GLOBAL",21)~ THEN O#LLKIMM k3
@185 /* Watch yourself here, Child of Bhaal. Death is always nearby. */ 
END
IF ~~ EXTERN O#LLKIMM k3.0

CHAIN O#LLKIMM k3.0
@186 /* What else do you want from me? */
END
+ ~Global("O#LLQuest","GLOBAL",20)~ + @187 /* Where should I find Lorn Jeven? */ EXTERN O#LLKIMM k3.lorn
+ ~Global("O#LLKimmurielTasks","GLOBAL",0)~ + @188 /* Do you have any tasks of your own for me to do? */ DO ~SetGlobal("O#LLKimmurielTasks","GLOBAL",1)~ EXTERN O#LLKIMM k3.first
+ ~GlobalLT("O#LLKimmurielTasks","GLOBAL",4) Dead("O#LLGITH") Dead("O#LLGIT2")~ + @189 /* I killed your githyanki. */ DO ~SetGlobal("O#LLKimmurielTasks","GLOBAL",4)~ EXTERN O#LLKIMM k3.second
+ ~Global("O#LLKimmurielTasks","GLOBAL",6)~ + @190 /* I have convinced the illithids, but they'll only fight the githyanki once you and I are already dead. */ DO ~SetGlobal("O#LLKimmurielTasks","GLOBAL",7)~ EXTERN O#LLKIMM k3.seconddone
+ ~Global("O#LLQuest","GLOBAL",13) Global("O#LLQuestC2","GLOBAL",0)~ + @191 /* Kimmuriel, I need your help. The captain wants to kill all the spies from the rival house, including your man. */ DO ~SetGlobal("O#LLQuestC2","GLOBAL",1)~ EXTERN O#LLKIMM k3.b
+ ~Global("O#LLQuest","GLOBAL",16)~ + @192 /* Guess what? The captain tried to kill me. But someone else got to him first. */ DO ~SetGlobal("O#LLQuest","GLOBAL",17)~ EXTERN O#LLKIMM k3.timeentreri
+ ~GlobalGT("O#LLQuest","GLOBAL",15)~ + @193 /* Why do you want to rescue Jarlaxle so much? */ EXTERN O#LLKIMM k3.7
+ ~GlobalGT("O#LLQuest","GLOBAL",15)~ + @194 /* How did you make Entreri work for you? */ EXTERN O#LLKIMM k3.8
+ ~GlobalGT("O#LLQuest","GLOBAL",15)~ + @195 /* You know, you've sort of started to grow on me, Kimmuriel. */ EXTERN O#LLKIMM k3.9
+ ~Dead("O#LLNELR")~ + @196 /* I had to kill one of your men. I am sorry. */ EXTERN O#LLKIMM k3.nelros
+ ~GlobalLT("O#LLQuest","GLOBAL",16)~ + @197 /* Tell me about this "friend" of Jarlaxle's. */ EXTERN O#LLKIMM k3.1
+ ~GlobalLT("O#LLQuest","GLOBAL",16)~ + @198 /* The Matron Mother doesn't seem to like you. */ EXTERN O#LLKIMM k3.2
+ ~GlobalLT("O#LLQuest","GLOBAL",16)~ + @199 /* How come you can't read the Matron Mother's mind? */ EXTERN O#LLKIMM k3.3
+ ~GlobalLT("O#LLQuest","GLOBAL",16)~ + @200 /* What should I do now? */ EXTERN O#LLKIMM k3.4
+ ~GlobalLT("O#LLQuest","GLOBAL",16)~ + @201 /* Tell me about the treasury. */ EXTERN O#LLKIMM k3.5
+ ~GlobalGT("O#LLDrowCityHostile","GLOBAL",0)~ + @202 /* I may have attacked a few locals... */ EXTERN O#LLKIMM k3.idiot
++ @203 /* It's over. Return me to Athkatla. */ EXTERN O#LLKIMM k3.o
++ @204 /* I should go. */ EXTERN O#LLKIMM k3.6

CHAIN O#LLKIMM k3.idiot
@205 /* As long as they were not the Spider Queen's handmaidens, nobody cares. Just keep it quiet. And for Lolth's sake, do not attack the merchants. */
END
IF ~~ EXTERN O#LLKIMM k3.0

CHAIN O#LLKIMM k3.lorn
@206 /* What, you suddenly lost the map of the city? Or was the meeting with the Matron Mother too much for you, and you forgot where the largest platform was? I didn't wipe your mind accidentally, I trust? Not that there was much to wipe in the first place. */
END
++ @207 /* All right, all right. I got it. I'll take the map and check for the largest platform. */ EXTERN O#LLKIMM k3.lorn3
++ @208 /* Would it kill you to give me a hint? */ EXTERN O#LLKIMM k3.lorn2

CHAIN O#LLKIMM k3.lorn2
@209 /* Wouldn't be as entertaining, would it? Besides, I need you capable, not begging for tips and crumbs. */
END
IF ~~ EXTERN O#LLKIMM k3.lorn3

CHAIN O#LLKIMM k3.lorn3
@210 /* And whatever the Matron Mother said, you will not kill Lorn Jeven outright. He is an ally, and a worthy asset, though still an expendable one. Find him, talk to him and wait for me. Is this clear? */
END
++ @211 /* Of course. */ EXTERN O#LLKIMM k3.0
++ @212 /* Find him, talk to him, wait for you. Got it. */ EXTERN O#LLKIMM k3.0
++ @213 /* We'll see. */ EXTERN O#LLKIMM k3.lorn4
++ @214 /* You can goad me all you want, but I'll have the last laugh, Oblodra. */ EXTERN O#LLKIMM k3.lorn4

CHAIN O#LLKIMM k3.lorn4
@215 /* You won't if you keep up this tone, insolent one. I could crush your head with kinetic energy as easily as I raised your shields. Besides, who would teleport you home? Certainly not the Matron Mother. */
= @216 /* Go now. I have preparations to make. And praise your good fortune that you are still alive, Bhaalspawn. Menzoberranzan is not the place for the smart mouthed, if your name is not Jarlaxle. */
END
IF ~~ EXTERN O#LLKIMM k3.0

CHAIN O#LLKIMM k3.nelros
@217 /* Do not talk to me about this again. I will remember your blunder, but it is for Jarlaxle to decide your punishment. If you save him, all will be forgotten. If not... */
END
IF ~~ EXTERN O#LLKIMM k3.0

CHAIN O#LLKIMM k3.o
@218 /* I can do that. Why should I? */
END
++ @219 /* Because I cannot hold on for much longer without my soul. */ EXTERN O#LLKIMM k3.o1
++ @220 /* Come on, we are in Menzoberranzan! Do you REALLY have to ask? */ EXTERN O#LLKIMM k3.o1
++ @221 /* Because I'm asking you nicely? */ EXTERN O#LLKIMM k3.o1
++ @222 /* Never mind. I will go. */ EXTERN O#LLKIMM k3.6

CHAIN O#LLKIMM k3.o1
@223 /* Without your soul, you are fading. And Jarlaxle had such plans for you... pity. */
= @224 /* Very well, Child of Bhaal. But once I am done with your teleportation, this adventure is over, and you will never hear from Bregan D'aerthe again. Are you sure of your choice? */
END
++ @225 /* No, I don't want that. I will stay. */ EXTERN O#LLKIMM k3.6
++ @226 /* Yes, I am. Send me home. */ EXTERN O#LLKIMM k3.o2

CHAIN O#LLKIMM k3.o2
@227 /* One day you will repay me for sparing your life now. Goodbye, Child of Bhaal. And beware of dark corners. */
DO ~SetGlobal("O#LLQuest","GLOBAL",1000)
EraseJournalEntry(@10002)
EraseJournalEntry(@10003)
EraseJournalEntry(@10004)
EraseJournalEntry(@10005)
EraseJournalEntry(@10006)
EraseJournalEntry(@10007)
EraseJournalEntry(@10008)
EraseJournalEntry(@10010)
EraseJournalEntry(@10011)
EraseJournalEntry(@10012)
EraseJournalEntry(@10015)
EraseJournalEntry(@10017)
EraseJournalEntry(@10019)
EraseJournalEntry(@10021)
EraseJournalEntry(@10022)
EraseJournalEntry(@10023)
EraseJournalEntry(@10024)
AddJournalEntry(@10009,QUEST_DONE)
ClearAllActions()
StartCutSceneMode()
StartCutScene("O#LLCut1")~
EXIT

CHAIN O#LLKIMM k3.b
@228 /* Indeed? It is good you came to me. */
= @229 /* Our man's name is Nelros. Find him and send him to me. Our deal with the good captain is over. Soon enough he will know the full anger of Bregan D'aerthe. */
= @230 /* Do not talk to the captain about this, or I shall seal your mind. To his knowledge, Nelros will have died with the others. */
END
++ @231 /* Yes, Kimmuriel. */ EXTERN O#LLKIMM k3.b1
+ ~Gender(Player1,FEMALE)~ + @232 /* Seal my mind? Will you be gentle? */ EXTERN O#LLKIMM k3.b2
++ @233 /* I will do as I please. You'd better back off. */ EXTERN O#LLKIMM k3.b2
++ @234 /* Really, you are an idiot. Why threaten me when I'm quite willing to help you? */ EXTERN O#LLKIMM k3.b2
++ @235 /* Sounds easy enough. */ EXTERN O#LLKIMM k3.b1

CHAIN O#LLKIMM k3.b1
@236 /* You are suspiciously... subservient, <CHARNAME>. Our men are expendable, but I expect you to treat their lives with respect. Do so, and I am your ally. Defy me... */
END
++ @237 /* And what? */ EXTERN O#LLKIMM k3.b3
++ @238 /* Yes, yes, yes, I know the score. Can we get to business now? */ EXTERN O#LLKIMM k3.b2

CHAIN O#LLKIMM k3.b2
@239 /* You are treating me like an equal when you should not. Each drow is infinitely your better, Child of Bhaal, until you learn to control the raw power in your veins. */
= @240 /* Until then you are only a surfacer, and to most drow little more than an animal. Remember this well. */
END
IF ~~ EXTERN O#LLKIMM k3.0

CHAIN O#LLKIMM k3.b3
@241 /* If Jarlaxle lives in the end? Nothing, most likely. But if he dies and it is your fault? You won't even have enough air to scream. */
END
IF ~~ EXTERN O#LLKIMM k3.0

CHAIN O#LLKIMM k3.first
@242 /* I do. The question is whether you are up to them. */ 
END
++ @243 /* Ha! I am capable, efficient, and, most importantly, invincible! */ EXTERN O#LLKIMM k3.f1
++ @244 /* As if there was any doubt. Tell me already! */ EXTERN O#LLKIMM k3.f1
++ @245 /* Of course not. I am an insignificant <PRO_RACE> far beneath your notice. Whatever can I do for the mighty Kimmuriel Oblodra but crawl under a rock somewhere and die quietly? */ EXTERN O#LLKIMM k3.f0

CHAIN O#LLKIMM k3.f0
@246 /* Sarcasm. I have this sudden burning desire to torture you. Sadly, responsibility for Bregan D'aerthe and Jarlaxle's well-being prevents me from following this impulse. */
END
IF ~~ EXTERN O#LLKIMM k3.f1

CHAIN O#LLKIMM k3.f1
@247 /* Your boasting aside, I do have a task for you. Two githyanki on the north-west platform. They must be killed. */ 
END
++ @248 /* Easy enough. */ EXTERN O#LLKIMM k3.f2
++ @249 /* What have they done to you? */ EXTERN O#LLKIMM k3.f2
++ @250 /* What, you don't need an enchanted ring from their corpses? Or a treasure map? */ EXTERN O#LLKIMM k3.f2

CHAIN O#LLKIMM k3.f2
@251 /* As honored guests of the Matron Mother, they have the second wardstone to a certain treasury. Should I continue? */ 
== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @252 /* Ah. Oh. We need that, don't we? */
== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @253 /* But that's another matter entirely! <CHARNAME>, stop dawdling! Move! */
== JANJ IF ~InParty("Jan") InMyArea("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN @254 /* No need to go on, my drow lad. By the look in <CHARNAME>'s eyes, <PRO_HESHE> is already there. */
== KORGANJ IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @255 /* Mayhap ye knows where the rest of these wardstones be? I wouldn't mind lootin' 'em all! */
== NALIAJ IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @256 /* This is important, then. Can we keep the stone? */
== O#LLKIMM @257 /* The stone is yours. Any information about their allies or why they are here is mine. Do not disappoint me. */ 
END
IF ~~ DO ~AddJournalEntry(@10007,QUEST)~ EXTERN O#LLKIMM k3.0

CHAIN O#LLKIMM k3.second
@258 /* There were more than two, weren't there? Tell me what you have learnt. */ 
END
++ @259 /* You forgot "please." */ EXTERN O#LLKIMM k3.s1
++ @260 /* Yes, there were. You could've warned me! */ EXTERN O#LLKIMM k3.s1
+ ~PartyHasItem("O#LW2")~ + @261 /* Why should I? I've got the wardstone. I don't care about the rest. */ EXTERN O#LLKIMM k3.s1
++ @262 /* They were looking for Jarlaxle. They think he is some Kalach-Cha who stole their precious silver sword. No, the Silver Sword. */ EXTERN O#LLKIMM k3.s0

CHAIN O#LLKIMM k3.s0
@263 /* Interesting. Another toy of Jarlaxle's? Now is really the worst time. */ 
DO ~GiveGoldForce(2000)
AddXPObject(Player1,20000)
AddXPObject(Player2,20000)
AddXPObject(Player3,20000)
AddXPObject(Player4,20000)
AddXPObject(Player5,20000)
AddXPObject(Player6,20000)~
== O#LLKIMM @264 /* But that is my problem and my headache. I will deal with it when Jarlaxle is free. */ 
= @265 /* For now, here is what I want you to do. Visit the illithid envoy nearby and ask for their allegiance to Bregan D'aerthe in an open fight with githyanki. Do you understand? */ 
END
++ @266 /* Perfectly. Consider it done. */ EXTERN O#LLKIMM k3.s3
++ @267 /* Why don't you do it yourself? */ EXTERN O#LLKIMM k3.s4
++ @268 /* We are going to fight githyanki? Here? */ EXTERN O#LLKIMM k3.s5

CHAIN O#LLKIMM k3.s3
@269 /* Good. Threaten, coerce, blackmail. Your method is immaterial. I need only the results. */
END
IF ~~ EXTERN O#LLKIMM k3.s5

CHAIN O#LLKIMM k3.s4
@270 /* If I wander the streets, the Matron's spies will suspect that something important is afoot. Soon after, the Matron will learn of our plans. I shall escape, but your life will be forfeit. */
END
IF ~~ EXTERN O#LLKIMM k3.s5

CHAIN O#LLKIMM k3.s5
@271 /* An open war with githyanki is not in our current plans. But if they see that we have slaughtered their envoy and allied with their ancient enemies, the githyanki will delay their attack. We will have just enough time to free our supposed Kalach-Cha. */ 
END
IF ~~ DO ~EraseJournalEntry(@10007)
EraseJournalEntry(@10008)
AddJournalEntry(@10010,QUEST)~ EXTERN O#LLKIMM k3.0

CHAIN O#LLKIMM k3.s1
@272 /* I will not bother with your surface ceremonies. I shall take the answers from your mind if I need to. Do I have to do that? */
END
++ @273 /* No. The githyanki are searching for Jarlaxle, the Kalach-Cha, as they called him, the wielder of the Silver Sword. */ EXTERN O#LLKIMM k3.s0
++ @274 /* Oh, bother. Kalach-Cha, Jarlaxle, the Silver Sword. Happy? */ EXTERN O#LLKIMM k3.s0
++ @275 /* Do your worst. */ EXTERN O#LLKIMM k3.s2

CHAIN O#LLKIMM k3.s2
@276 /* So be it. You will be nauseous for the rest of the evening, but I find myself not caring. */
END
IF ~~ EXTERN O#LLKIMM k3.s0

CHAIN O#LLKIMM k3.seconddone
@277 /* Better than nothing. You have done well. */ 
DO ~GiveGoldForce(2000)
AddXPObject(Player1,20000)
AddXPObject(Player2,20000)
AddXPObject(Player3,20000)
AddXPObject(Player4,20000)
AddXPObject(Player5,20000)
AddXPObject(Player6,20000)
EraseJournalEntry(@10010)~
== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @278 /* A compliment from a drow? Suspicious. */
== HAERDAJ IF ~InParty("Haerdalis") InMyArea("Haerdalis") !StateCheck("Haerdalis",CD_STATE_NOTVALID)~ THEN @279 /* Better than well, my dour owl. We have surpassed your expectations, I dare say. */
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @280 /* Good. Now, I expect, we shall finally move to the business of saving Jarlaxle. */
== MAZZYJ IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @281 /* I feel used and dirty. He is not about to give us another of his little missions, is he? */
== VALYGARJ IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN @282 /* Do you have other tasks for us, drow? */
== O#LLKIMM @283 /* This is it for now. I am expecting a visit from the Matron Mother soon, and it is best if you are not here. Disappear, become a ghost, come back when I am alone. Do you understand me? */ 
END
++ @284 /* Yes, but... */ EXTERN O#LLKIMM k3.seconddone1
++ @285 /* Why should I go? */ EXTERN O#LLKIMM k3.seconddone1
++ @286 /* I was hoping we'd have time to chat for a bit. */ EXTERN O#LLKIMM k3.seconddone1
++ @287 /* I will go. */ EXTERN O#LLKIMM k3.6

CHAIN O#LLKIMM k3.seconddone1
@288 /* Do not be an idiot. We just negotiated with the illithid envoy behind the Matron Mother's back. She will be out for blood. Stay if you wish, but do not be surprised when you are flayed alive. */
END
++ @289 /* What about you? */ EXTERN O#LLKIMM k3.seconddone2
++ @290 /* And you won't be amused by the sight? Or sad, perhaps? */ EXTERN O#LLKIMM k3.seconddone2
++ @291 /* All right, I'll go. */ EXTERN O#LLKIMM k3.seconddone3

CHAIN O#LLKIMM k3.seconddone2
@292 /* I would watch, but keeping you alive takes priority over listening to your screams. As for my own skin, it's a stalemate. The Matron Mother still needs Bregan D'aerthe, so I am safe... for now. You are not. */
END
IF ~~ EXTERN O#LLKIMM k3.0
IF ~GlobalLT("O#LLQuest","GLOBAL",16)~ EXTERN O#LLKIMM k3.seconddone4

CHAIN O#LLKIMM k3.seconddone3
@293 /* Good. I would rather prevent the Matron from spraying the carpets with your blood. */
END
IF ~~ EXTERN O#LLKIMM k3.seconddone2

CHAIN O#LLKIMM k3.seconddone4
@294 /* And you still have to report to me on your tasks with the captain. That is, if you've even completed them all. */
END
IF ~~ EXTERN O#LLKIMM k3.0

CHAIN O#LLKIMM k3.timeentreri
@295 /* Indeed? Who was it? */ 
END
++ @296 /* Artemis Entreri in the flesh. And he said that you lied to me! */ EXTERN O#LLKIMM k3.t2
++ @297 /* I *think* it was Artemis Entreri, but never mind that. Why did you lie to me, Kimmuriel? */ EXTERN O#LLKIMM k3.t2
++ @298 /* I am not sure. A short human with dark hair and a tanned face. He also said you weren't honest with me. */ EXTERN O#LLKIMM k3.t1
++ @299 /* What, you can't just read it in my mind? */ EXTERN O#LLKIMM k3.t0

CHAIN O#LLKIMM k3.t0
@300 /* Perhaps I am willing to go the mundane way this time. But only one person could have helped you. */
END
IF ~~ EXTERN O#LLKIMM k3.t2

CHAIN O#LLKIMM k3.t1
@301 /* You did not recognize Artemis Entreri? Strange. I thought a <PRO_MANWOMAN> of your adventuring profession would know <PRO_HISHER> esteemed rivals. */
END
IF ~~ EXTERN O#LLKIMM k3.t2

CHAIN O#LLKIMM k3.t2
@302 /* Artemis Entreri is a... difficult person. Things are not as they seem. */ 
END
++ @303 /* Enlighten me, then. */ EXTERN O#LLKIMM k3.t3
++ @304 /* Did you lie to me or not? */ EXTERN O#LLKIMM k3.t3

CHAIN O#LLKIMM k3.t3
@305 /* Jarlaxle wasn't kidnapped in the search of demonic artifacts or anything of the kind. He was tasked to assassinate the Matron Mother. Quickly, quietly, efficiently. He failed. */ 
END
++ @306 /* Who gave him the task? */ EXTERN O#LLKIMM k3.t4
++ @307 /* A male killing a Matron Mother in her own citadel in Menzoberranzan? It's crazy! */ EXTERN O#LLKIMM k3.t5

CHAIN O#LLKIMM k3.t4
@308 /* There was an old debt. Suffice it to say it was a mission he could not refuse. */
END
IF ~~ EXTERN O#LLKIMM k3.t6

CHAIN O#LLKIMM k3.t5
@309 /* It's Menzoberranzan politics. */
END
IF ~~ EXTERN O#LLKIMM k3.t6

CHAIN O#LLKIMM k3.t6
@310 /* And it is your task now. While the Matron Mother lives, Jarlaxle remains imprisoned in her vaults, or worse. Rat torture is everything one needs to break even the strongest of men. */ 
DO ~AddXPObject(Player1,20000)
AddXPObject(Player2,20000)
AddXPObject(Player3,20000)
AddXPObject(Player4,20000)
AddXPObject(Player5,20000)
AddXPObject(Player6,20000)
EraseJournalEntry(@10011)~
== O#LLKIMM @311 /* The Matron Mother believes that I am grateful to her for Jarlaxle's disappearance, since Bregan D'aerthe is now fully mine. But we have little time. You must move quickly. */ 
END
++ @312 /* Why are you talking about it so openly? */ EXTERN O#LLKIMM k3.t8
++ @313 /* I am not sure I trust you any longer, Kimmuriel. */ EXTERN O#LLKIMM k3.t7
++ @314 /* Why didn't you tell me the truth right away? */ EXTERN O#LLKIMM k3.t7
++ @315 /* All right. What should I do? */ EXTERN O#LLKIMM k3.t8

CHAIN O#LLKIMM k3.t7
@316 /* If you think I ever trusted you, you are a true moron. The Matron Mother has amulets that detect any intent to kill her. My mind is protected. You weren't to know. */
END
IF ~~ EXTERN O#LLKIMM k3.t8

CHAIN O#LLKIMM k3.t8
@317 /* While you dallied about with insignificant matters, I have dealt with the Matron's spies in this very building. Not a difficult task, but an exhausting one. */ 
== CERNDJ IF ~InParty("Cernd") InMyArea("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN @318 /* I am glad we did not have to take part in this. Striking down unarmed men does not sit well with me. */
== IMOEN2J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @319 /* So now we can speak freely? That's... good, right? */
== KELDORJ IF ~InParty("Keldorn")InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @320 /* What now? Do you have another task for us, drow? */
== MINSCJ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @321 /* Spies' eyes have no flavor, Boo says. Give us a real fight! */
== VICONIJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @322 /* A wise decision. Their webs are ever spread for the unwary. */
== O#LLKIMM @323 /* Now we wait. Neither you nor I have much choice. Artemis Entreri will soon bring us the location of the first wardstone. With it, you shall be able to pass through the first barrier that leads to the Matron's stronghold. */ 
== O#LLKIMM @324 /* You can use the time to walk around the city, but do not stray far. */ 
END
IF ~~ EXTERN O#LLKIMM k3.0
IF ~GlobalLT("O#LLKimmurielTasks","GLOBAL",6)~ EXTERN O#LLKIMM k3.t9
IF ~Global("O#LLKimmurielTasks","GLOBAL",0)~ EXTERN O#LLKIMM k3.t10

CHAIN O#LLKIMM k3.t9
@325 /* After all, you must complete a task of mine, do you not? */
END
IF ~~ EXTERN O#LLKIMM k3.0

CHAIN O#LLKIMM k3.t10
@326 /* Besides, I may have some tasks for you. Approach me again when you are fit and rested. */
END
IF ~~ EXTERN O#LLKIMM k3.0

CHAIN O#LLKIMM k3.1
@327 /* You will meet him soon enough. He is a human assassin by the name of Artemis Entreri. */
END
++ @328 /* What? THE Artemis Entreri? */ EXTERN O#LLKIMM k3.1b
++ @329 /* I've heard of him. He had some grudge with Drizzt. */ EXTERN O#LLKIMM k3.1b
++ @330 /* Did you also send him here against his will? */ EXTERN O#LLKIMM k3.1a

CHAIN O#LLKIMM k3.1a
@331 /* Of course. He hates my home with a passion. Once here, however, he proved very useful. If you follow through with the Matron's tasks, you shall find him soon. Or, rather, he will find you. */
END
IF ~~ EXTERN O#LLKIMM k3.1b

CHAIN O#LLKIMM k3.1b
@332 /* Whatever you do, don't mention Drizzt Do'Urden in front of him. He does not take it well. A long-standing fencing rivalry or some other bother. */
= @333 /* And prepare to be disappointed. He is not the friendliest fellow. */
END
IF ~~ EXTERN O#LLKIMM k3.0

CHAIN O#LLKIMM k3.2
@334 /* Jarlaxle has a way with her. I am not as... */
END
++ @335 /* Successful? */ EXTERN O#LLKIMM k3.2a
++ @336 /* Charming? */ EXTERN O#LLKIMM k3.2a
++ @337 /* Good at the art of intrigue? */ EXTERN O#LLKIMM k3.2a
++ @338 /* You're not Jarlaxle. */ EXTERN O#LLKIMM k3.2a

CHAIN O#LLKIMM k3.2a
@339 /* I am not Jarlaxle. And you, Child of Bhaal, are not here on a leisure trip. Unless you like Menzoberranzan so much that you want to remain the Matron Mother's toy for good? */
= @340 /* Remember that even favorite toys break. */
END
IF ~~ EXTERN O#LLKIMM k3.0

CHAIN O#LLKIMM k3.3
@341 /* Her mind is well protected by powerful artifacts. Some Matron Mothers have illithid allies, but Matron Mother Jeven trusts no one. */
END
++ @342 /* You sound as if you respect her. */ EXTERN O#LLKIMM k3.3a
++ @343 /* Good choice. I'd like to get my hands on these artifacts. */ EXTERN O#LLKIMM k3.3b

CHAIN O#LLKIMM k3.3a
@344 /* And you would be foolish not to do the same. We are in her house, surrounded by her people. Show the slightest disrespect, and you will die. */
END
IF ~~ EXTERN O#LLKIMM k3.0

CHAIN O#LLKIMM k3.3b
@345 /* You are not alone in your desire. Several houses have tried and failed. */
END
IF ~~ EXTERN O#LLKIMM k3.0

CHAIN O#LLKIMM k3.4
@346 /* Whatever the Matron Mother or her lackeys tell you. Or have you suddenly become deaf? */ 
= @347 /* Explore the city when you can. Local merchants may provide some supplies. You will never rise higher than the lowest drow, but earning more prestige can improve your standing. */
END
++ @348 /* Meaning I won't be whipped by tentacle rods if I misstep? */ EXTERN O#LLKIMM k3.4a
++ @349 /* Why should I bother what some lackey of Lolth's thinks of me? */ EXTERN O#LLKIMM k3.4a
++ @350 /* Good point. More loot, too. */ EXTERN O#LLKIMM k3.4b

CHAIN O#LLKIMM k3.4a
@351 /* You are practically inviting the tentacle rods now. On some other day it would be amusing to watch, but I need you alive. */
END
++ @352 /* Poor Kimmuriel. Like every drow male, you have felt their touch on your own skin, no doubt. */ EXTERN O#LLKIMM k3.4c
++ @353 /* Why the sudden concern? Do you actually like me? */ EXTERN O#LLKIMM k3.4c
++ @354 /* All right, all right. Doing menial tasks, bowing before the Matron Mother. Got it. */ EXTERN O#LLKIMM k3.4b
++ @355 /* I need myself alive, too. I'll behave. */ EXTERN O#LLKIMM k3.4b

CHAIN O#LLKIMM k3.4b
@356 /* I am glad to see a pragmatic approach. */
END
IF ~~ EXTERN O#LLKIMM k3.0

CHAIN O#LLKIMM k3.4c
@357 /* You are starting to tire me out, Bhaalspawn. Unless you wish to be thrown into the Clawrift after your tasks are done, hold your tongue. Other drow will not be as forgiving. */
END
IF ~~ EXTERN O#LLKIMM k3.0

CHAIN O#LLKIMM k3.5
@358 /* You are a fool for asking about it so openly. But the question makes sense for any greedy mercenary, so I will let this one pass. */
= @359 /* The treasury is located deep within the Matron Mother's palace. To enter it, you need three separate wardstones. The fourth wardstone guards the entrance to the treasury. Nobody knows who wields the stones, and only the Matron Mother has them all. */
END
IF ~~ EXTERN O#LLKIMM k3.0

CHAIN O#LLKIMM k3.6
@360 /* Do try to survive. And don't even dare think about attacking anyone you weren't ordered to kill. */ 
EXIT

CHAIN O#LLKIMM k3.7
@361 /* Because he is the cornerstone of Bregan D'aerthe. Do you think Jarlaxle is a nameless mercenary? That House Baenre, the First House of Menzoberranzan, tolerates a mere male having such power? */
= @362 /* If you indeed thought so, you were a fool. Jarlaxle Baenre is the brother, friend, and confidant of Archmage Gromph, Master of Sorcere. He has the ear of current Matron Mother Baenre and the respect of the remaining Heads of Houses. He is all that... */
END
++ @363 /* ... that you are not? */ + k3.71
++ @364 /* ... that you wish you were? */ + k3.71
++ @365 /* ... that the true leader of Bregan D'aerthe should be? */ + k3.71
++ @366 /* And you need his connections and his influence. I get that. */ + k3.71
++ @367 /* And I bet this Archmage Gromph will not look at you kindly if you get his little brother killed. */ + k3.71

CHAIN O#LLKIMM k3.71
@368 /* Astute. And wrong. Jarlaxle has been on the surface with Entreri for quite a while, yet Bregan D'aerthe prospers under my command. */
= @369 /* Jarlaxle's connections and charm are not all I seek. House Baenre would not implicate me in his loss, either, for it was them who ordered the hit on House Jeven. No, it is much simpler. */
END
++ @370 /* Jarlaxle is a friend who's always had your back, right? And, pragmatic as you are, you don't want to lose this protection, even if it costs you. */ + k3.72
++ @371 /* Gratitude? A desire to save a friend? This is unlike you, Kimmiruel. */ + k3.73
++ @372 /* What is it? */ + k3.74

CHAIN O#LLKIMM k3.72
@373 /* That's... not far from the truth. Interesting. You are intelligent after all. */
END
IF ~~ EXTERN O#LLKIMM k3.74

CHAIN O#LLKIMM k3.73
@374 /* There are no friends in the Underdark, <PRO_RACE>. You will live longer if you remember that. */
END
IF ~~ EXTERN O#LLKIMM k3.74

CHAIN O#LLKIMM k3.74
@375 /* Jarlaxle is an asset. He cheated liches and lied to dragons, destroyed artifacts of untold power, and danced with death every day of his life. To some, Jarlaxle is worth much more than ten minor houses of Menzoberranzan put together. And he is certainly worth the risk. */
= @376 /* But enough about Jarlaxle. Neither of us have time for idle chat. */
END
IF ~~ EXTERN O#LLKIMM k3.0

CHAIN O#LLKIMM k3.8
@377 /* Artemis Entreri and Jarlaxle travelled together for a while. I would even say they became friends. A strange pair indeed. Entreri, a human, embodies the virtues of the finest drow warriors while Jarlaxle, a drow of the most noble lineage, is everything we are not. */
= @378 /* When Jarlaxle went on his mission to kill the Matron Mother, he left Entreri behind. Or maybe the human did not wish to return to Menzoberranzan. I decided he would prove useful, brought him here and gave him a task. There is little else to it. */
END
++ @379 /* Entreri hates you for bringing him to the Underdark against his will, doesn't he? */ EXTERN O#LLKIMM k3.81
++ @380 /* You could have at least asked for his opinion. */ EXTERN O#LLKIMM k3.81
++ @381 /* I approve. He is a skilled assassin. */ EXTERN O#LLKIMM k3.81

CHAIN O#LLKIMM k3.81
@382 /* I care little of what he wants or thinks. But if there is anyone, besides yourself, who can find the wardstones and enter the Matron Mother's stronghold, it is him. */
= @383 /* Jarlaxle is important to Entreri after all. They are rivals, loners, but they complement each other better than many blood brothers do. Well... surface blood brothers at any rate. */
= @384 /* Conveniently for me, Entreri also feels guilty for letting Jarlaxle go on his mission alone, so he will perform at his finest. And you'd better deliver, both of you. */
END
IF ~~ EXTERN O#LLKIMM k3.0

CHAIN O#LLKIMM k3.9
@385 /* Should I even care about this... statement? */ 
END
++ @386 /* Sure! You're an evil psionicist who doesn't mind torturing people to get what he wants. It's a match made in heaven! */ EXTERN O#LLKIMM k3.91
++ @387 /* Why not? It's a pity you're stuck in the Underdark. Together we could rule the world! */ EXTERN O#LLKIMM k3.92
++ @388 /* Maybe I'll miss your sunny personality. You never know. */ EXTERN O#LLKIMM k3.93
+ ~Gender(Player1,FEMALE)~ + @389 /* Come on! Ever looked in the mirror? You're drop-dead gorgeous! */ EXTERN O#LLKIMM k3.94

CHAIN O#LLKIMM k3.91
@390 /* Shutting you up and torturing you to death doesn't seem a half bad idea at the moment. But I'll pass. */
END 
IF ~~ EXTERN O#LLKIMM k3.95

CHAIN O#LLKIMM k3.92
@391 /* And will you be so trusting and guileless as to believe I would want to share? */
END 
IF ~~ EXTERN O#LLKIMM k3.95

CHAIN O#LLKIMM k3.93
@392 /* Indeed, you don't. I might even think about yours once or twice. With a shudder, probably. */
END 
IF ~~ EXTERN O#LLKIMM k3.95

CHAIN O#LLKIMM k3.94
@393 /* Go to the lust chambers, Bhaalspawn, and stop wasting my time. */
END 
IF ~~ EXTERN O#LLKIMM k3.95

CHAIN O#LLKIMM k3.95
@394 /* I do not think you are doing yourself a service by trying to find a friend in me. But if it makes our mission easier, it is not unappreciated. */ 
END
IF ~~ EXTERN O#LLKIMM k3.0

/* =====================================================

			Captain

===================================================== */

BEGIN O#LLCAPT

CHAIN IF ~Global("O#LLQuest","GLOBAL",11)~ THEN O#LLCAPT c1
@395 /* Surfacers walking free in Menzoberranzan, Bregan D'aerthe employing a Child of Bhaal... Never happened in my time. Truly Jarlaxle has lost his mind. */ 
END
++ @396 /* I've heard that Jarlaxle disappeared, actually. */ EXTERN O#LLCAPT c1.1
++ @397 /* I actually agree. Why not just hire more drow? Why me? */ EXTERN O#LLCAPT c1.2
++ @398 /* You look old, even for a drow. You must be skilled to survive here. */ EXTERN O#LLCAPT c1.3
++ @399 /* I am here at the Matron Mother's command. What should I do? */ EXTERN O#LLCAPT c1.task
 
CHAIN O#LLCAPT c1.1
@400 /* That cad? Not that I've heard of it... and not that it's any of your business, surfacer. */
END
IF ~~ EXTERN O#LLCAPT c1.task

CHAIN O#LLCAPT c1.2
@401 /* Trust. A drow mercenary will happily stab you in the back or sell you to another house, but a surfacer has nowhere to go. */
END
IF ~~ EXTERN O#LLCAPT c1.task

CHAIN O#LLCAPT c1.3
@402 /* Skill with my blades has nothing to do with it, foolish <PRO_GIRLBOY>. I am useful to the Matron Mother, and those who covet my position do not survive for long. */
END
IF ~~ EXTERN O#LLCAPT c1.task

CHAIN O#LLCAPT c1.task
@403 /* How old are you? Barely past your Blooding, and I'm supposed to trust you with the house's safety? Feh. Well, then, a simple task to prove your worth. */ 
DO ~SetGlobal("O#LLQuest","GLOBAL",12)
EraseJournalEntry(@10002)
AddJournalEntry(@10003,QUEST)~
== O#LLCAPT @404 /* A championship between the house's best male fighters just ended. Yet the men are still restless. These are our best fighters, and the house needs them ready. */ 
== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @405 /* B-but we don't even know anything about them! */
== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @406 /* What a waste of our time. But I suppose we have no other options, do we? */
== CERNDJ IF ~InParty("Cernd") InMyArea("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN @407 /* An interesting first task. The captain expects us to fail, I expect. */
== KORGANJ IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @408 /* And if there's a little disagreement, the house won't miss a few dead drow, aye? */
== MAZZYJ IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @409 /* Where shall we find them? */
== O#LLCAPT @410 /* Go to the east platform. Find out what their problem is and calm them down. */ 
END
++ @411 /* Not kill them? */ EXTERN O#LLCAPT c1.5
++ @412 /* Very well. */ EXTERN O#LLCAPT c1.6
++ @413 /* Will they listen to a surfacer? */ EXTERN O#LLCAPT c1.7
++ @414 /* With an apple pie. Bet they'll like it! */ EXTERN O#LLCAPT c1.8

CHAIN O#LLCAPT c1.5
@415 /* No. We need every able-bodied man to fight a rival house. Doesn't concern you, anyway: you'll be long dead by the time they attack. */
EXIT

CHAIN O#LLCAPT c1.6
@416 /* Meek, are you? Or just following orders? No matter: you'll be dead soon enough. */
EXIT

CHAIN O#LLCAPT c1.7
@417 /* It is *your* task to make them listen, isn't it? Pray to Lolth you succeed, surfacer. */
EXIT

CHAIN O#LLCAPT c1.8
@418 /* What is this "apple pie"? Bah, whatever. Do whatever you want, but leave them alive. House Jeven needs them. */
EXIT

CHAIN IF ~Global("O#LLQuest","GLOBAL",12)~ THEN O#LLCAPT c2
@419 /* Do not approach me if you have nothing to report. */ 
END
+ ~Global("O#LLFIG1","GLOBAL",3)~ + @420 /* Actually, I found the cheater. The men dispersed. */ EXTERN O#LLCAPT c2.1
+ ~Dead("O#LLFIG1") Dead("O#LLFIG2") Dead("O#LLFIG3")~ + @421 /* All your men are dead. Anything else? */ EXTERN O#LLCAPT c2.2
++ @422 /* You look grouchy. Do you want an apple pie? */ EXTERN O#LLCAPT c2.0
++ @423 /* Never mind. */ EXIT

CHAIN O#LLCAPT c2.0
@424 /* Bah! I thought the Matron Mother had exotic tastes, but I never guessed she'd hire such morons. Get. Out. Of. My. Sight! */
EXIT

CHAIN O#LLCAPT c2.1
@425 /* Better than I hoped. Hmph. Here is your payment, sellsword. */ 
END
IF ~~ DO ~GiveGoldForce(1000)~ EXTERN O#LLCAPT c2.task

CHAIN O#LLCAPT c2.2
@426 /* You are a bumbling, incompetent idiot. But since you killed six of our best fighters, you are not completely useless. */ 
END
IF ~~ EXTERN O#LLCAPT c2.task

CHAIN O#LLCAPT c2.task
@427 /* There are spies from the rival house all over the place. Thankfully, Bregan D'aerthe assisted us in placing a double agent in their midst. */ 
DO ~SetGlobal("O#LLQuest","GLOBAL",13)
AddXPObject(Player1,20000)
AddXPObject(Player2,20000)
AddXPObject(Player3,20000)
AddXPObject(Player4,20000)
AddXPObject(Player5,20000)
AddXPObject(Player6,20000)
EraseJournalEntry(@10003)
EraseJournalEntry(@10004)
EraseJournalEntry(@10005)
AddJournalEntry(@10006,QUEST)~
== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @428 /* Really? How useful of them. A double agent. Is there a triple agent somewhere here, I wonder? A quadruple agent? (No, Edwin, stop here!) */
== HAERDAJ IF ~InParty("Haerdalis") InMyArea("Haerdalis") !StateCheck("Haerdalis",CD_STATE_NOTVALID)~ THEN @429 /* Intrigue upon another intrigue! Pray, go on. */
== IMOEN2J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @430 /* Hmm. Kimmuriel will be interested in this. Should we go and talk to him? */
== MINSCJ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @431 /* Boo does not like this very much, but both he and Minsc trust our friend <CHARNAME> to deal with these spies carefully. Boo also says that a good boot in the backside is our best strategy. */
== NALIAJ IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @432 /* Do they know about each other? How do they communicate? */
== O#LLCAPT @433 /* They communicate through colors. The current one is red. Your task is simple: kill each and every drow who wears anything red on the streets today. Now. */ 
== O#LLCAPT @434 /* And do not bother entering the tavern or the lust chambers. The spies are too wary of becoming trapped. */ 
END
++ @435 /* But what if I kill an innocent drow? Not a spy? */ EXTERN O#LLCAPT c2.3
++ @436 /* Should I dispose of the double agent, too? He is on your side, isn't he? */ EXTERN O#LLCAPT c2.4
++ @437 /* Sure. Kill everybody wearing red, eh? Sounds like fun. */ EXTERN O#LLCAPT c2.5
++ @438 /* You know, if only they were holding slices of apple pie instead... */ EXTERN O#LLCAPT c2.6

CHAIN O#LLCAPT c2.3
@439 /* Do you think anyone cares? */
END
IF ~~ EXTERN O#LLCAPT c2.5

CHAIN O#LLCAPT c2.4
@440 /* Bregan D'aerthe knows only one side, surfacer: their own. */
END
IF ~~ EXTERN O#LLCAPT c2.5

CHAIN O#LLCAPT c2.5
@441 /* Kill them all and let a river of their blood run right back to me. Go! */
EXIT

CHAIN O#LLCAPT c2.6
@442 /* Gaah!! Why do I have to put up with this stupidity? May Lolth torture you for an eternity in her Demonweb Pits, surfacer! Or, better yet, may you never taste this "pie" of yours ever again! */
EXIT

CHAIN IF ~Global("O#LLQuest","GLOBAL",13)~ THEN O#LLCAPT c3
@443 /* Back already? Well? */ 
END
+ ~OR(2) Global("O#LLQuestC2","GLOBAL",2) Dead("O#LLNELR") Dead("O#LLSPY1") Dead("O#LLSPY2") Dead("O#LLSPY3") Dead("O#LLSPY4")~ + @444 /* I have done as you asked. Their corpses are yet warm. */ EXTERN O#LLCAPT c3.2
++ @445 /* Nothing yet. */ EXTERN O#LLCAPT c3.1
++ @446 /* I was wondering if the tiniest piece of apple pie will soothe your nerves and calm your black drow heart... no? */ EXTERN O#LLCAPT c3.0

CHAIN O#LLCAPT c3.0
@447 /* No! NO! NOOO!!! */
= @448 /* No. */
= @449 /* Go away. */
EXIT
 
CHAIN O#LLCAPT c3.1
@450 /* Some assassins you are. Get your ass out of here, come on! Go! */
EXIT

CHAIN O#LLCAPT c3.2
@451 /* Good. Good! And now, finally that you've proven your worth, I have something for you. */
END
++ @372 /* What is it? */ EXTERN O#LLCAPT c3.4
++ @452 /* I hope it's money. I like money. */ EXTERN O#LLCAPT c3.4
++ @453 /* Apple pie? */ EXTERN O#LLCAPT c3.3

CHAIN O#LLCAPT c3.3
@454 /* GAAAH!!! Must... kill... <PRO_HIMHER>... now... no, not the time. Not the place. */
END
IF ~~ EXTERN O#LLCAPT c3.4

CHAIN O#LLCAPT c3.4
@455 /* Not here. Too many ears listening. Follow me. Alone. */ 
== JANJ IF ~InParty("Jan") InMyArea("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN @456 /* I have a very bad feeling about this... */
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @457 /* Why does he want you alone? Back off from him, <CHARNAME>: I do not like the glint in his eye. */
== KELDORJ IF ~InParty("Keldorn")InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @458 /* I sense treachery. Prepare yourself. */
== VALYGARJ IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN @459 /* Ready your blade, <CHARNAME>. He has some foul plan in mind. */
== VICONIJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @460 /* "Alone"? We do not count, I suppose. So be it. The fool will bitterly regret ignoring your strength. */
== O#LLCAPT @461 /* You will not be disappointed, Bhaalspawn, I promise. */
DO ~SetGlobal("O#LLQuest","GLOBAL",14)
AddXPObject(Player1,20000)
AddXPObject(Player2,20000)
AddXPObject(Player3,20000)
AddXPObject(Player4,20000)
AddXPObject(Player5,20000)
AddXPObject(Player6,20000)
AddJournalEntry(@10011,QUEST)
EraseJournalEntry(@10006)
ClearAllActions()
StartCutSceneMode()
StartCutScene("O#LLCut3")~
EXIT

CHAIN IF ~Global("O#LLQuest","GLOBAL",14)~ THEN O#LLCAPT c4
@462 /* So. We are alone, you and I. Good. */ 
END
IF ~~ EXTERN O#LLCAPT c4.k
IF ~Gender(Player1,FEMALE)~ EXTERN O#LLCAPT c4.r

CHAIN O#LLCAPT c4.r
@463 /* Long before you were born, my feet tramped the surface. Blood danced in my veins - that surface raid was my first and the very best. And then I saw her. A surface woman, even younger than you. */ 
END
++ @464 /* Stop. I don't want to hear it. */ EXTERN O#LLCAPT c4.rno
++ @465 /* Go on. You raped her, didn't you? */ EXTERN O#LLCAPT c4.ryes

CHAIN O#LLCAPT c4.rno
@466 /* And I don't want to talk. I'd rather... show you. */
END
IF ~~ EXTERN O#LLCAPT c4.k

CHAIN O#LLCAPT c4.ryes
@467 /* That woman was mine by right. */
END
++ @468 /* Just shut up. I don't want to listen to the tales of your depravities. */ EXTERN O#LLCAPT c4.rno
++ @469 /* I should have known. */ EXTERN O#LLCAPT c4.ryes2

CHAIN O#LLCAPT c4.ryes2
@470 /* I took her twice, from behind, and her screams and her warm breasts filled me with desire. */
= @471 /* Her blood was warm, too. It ran hot as I cut her throat. And her hair... it was just like yours. Same color, same length. I scalped her afterwards. Your scalp will look good next to hers, I think. */
END
++ @472 /* So... no reward, then? You want to rape me, kill me and scalp me, do I understand correctly? */ EXTERN O#LLCAPT c4.a
++ @473 /* Please. You're just an impotent, evil little man. */ EXTERN O#LLCAPT c4.r1
++ @474 /* You idiot. I am a daughter of Bhaal! The Slayer will rip you limb from limb! */ EXTERN O#LLCAPT c4.r2
++ @475 /* No, I think I'll just kill you. Ugh. */ EXTERN O#LLCAPT c4.a
++ @476 /* You know, you REALLY should've chosen a slice of apple pie instead. */ EXTERN O#LLCAPT c4.r3

CHAIN O#LLCAPT c4.r1
@477 /* You will learn of my impotence well enough when I whip you between your legs. */
END
IF ~~ EXTERN O#LLCAPT c4.a

CHAIN O#LLCAPT c4.r2
@478 /* You won't be turning into any Slayer if you're unconscious. And Bhaalspawn or no, you are just a surface woman. Pliable. Weak. */
END
IF ~~ EXTERN O#LLCAPT c4.a

CHAIN O#LLCAPT c4.r3
@479 /* AAAAAARGH! You will beg me for mercy when my... when I... You Bhaalspawn filth! */
END
IF ~~ EXTERN O#LLCAPT c4.a

CHAIN O#LLCAPT c4.k
@480 /* You are good at what you do, Bhaalspawn. In fact, you are too good. */ 
= @481 /* I see what you are up to: you've completed both my tasks with barely any effort, and you're hungry for the Matron Mother's favor. In other words, you're competition. */ 
END
IF ~~ EXTERN O#LLCAPT c4.a

CHAIN O#LLCAPT c4.a
@482 /* Do I need to say it any plainer? You're dead meat. */ 
DO ~SetGlobal("O#LLQuest","GLOBAL",15)
ClearAllActions()
StartCutSceneMode()
StartCutScene("O#LLCut4")~
EXIT

/* =====================================================

	Artemis Entreri's appearances

===================================================== */

BEGIN O#LLARTE

// 1. Killing the captain

CHAIN IF ~Global("O#LLQuest","GLOBAL",15)~ THEN O#LLARTE a1
@483 /* No. You are. */ 
END
++ @484 /* He is. Dead meat, no question. */ EXTERN O#LLARTE a1.1
++ @485 /* Who the hell are you? */ EXTERN O#LLARTE a1.1
++ @486 /* Thanks for taking out the trash. Wait, you're no drow... */ EXTERN O#LLARTE a1.1

CHAIN O#LLARTE a1.1
@487 /* You're the Bhaalspawn. Who brought you here? Oblodra? */ 
= @488 /* He probably lied to you, too. No matter. We are both stuck here. Report to him, if you like. I have another task to complete. */ 
END
++ @489 /* Wait, he lied to me? About what? */ EXTERN O#LLARTE a1.2
++ @490 /* Kimmuriel? Lied? No. Never! He is an honest, law-abiding drow... oh. */ EXTERN O#LLARTE a1.2
++ @491 /* Why don't you come with me? */ EXTERN O#LLARTE a1.2

CHAIN O#LLARTE a1.2
@492 /* I have to move. I only have a small window to find the first wardstone, and it is closing. */ 
== O#LLARTE @493 /* Return to Oblodra. You'll only slow me down. */ 
DO ~SetGlobal("O#LLQuest","GLOBAL",16)
ClearAllActions()
StartCutSceneMode()
StartCutScene("O#LLCut5")~
EXIT

// 2. Near the first barrier.

CHAIN IF ~Global("O#LLQuest","GLOBAL",24)~ THEN O#LLARTE a2
@494 /* You still live, I see. */ 
END
++ @495 /* Nice to see you, too. */ EXTERN O#LLARTE a2.1
++ @496 /* So do you. */ EXTERN O#LLARTE a2.1
++ @497 /* Where is the wardstone, Entreri? */ EXTERN O#LLARTE a2.1

CHAIN O#LLARTE a2.1
@498 /* The assault on this house will start soon. You must move quickly. */ 
= @499 /* Jey'Re Jeven has the wardstone. He is the Matron Mother's trusted advisor and military commander. Do not underestimate him. */ 
END
++ @500 /* I won't. I'll just kill him. */ EXTERN O#LLARTE a2.2
++ @501 /* Where can I find him? */ EXTERN O#LLARTE a2.2

CHAIN O#LLARTE a2.2
@502 /* An hour ago he was in the lust chambers. He may still be there, and he won't be alone. */ 
= @503 /* Kill him quickly, Bhaalspawn. Once you pass through the barriers, Oblodra and I will follow you to the palace. */ 
END
++ @504 /* You're not coming with me? */ EXTERN O#LLARTE a2.3
++ @505 /* All right. */ EXTERN O#LLARTE a2.3

CHAIN O#LLARTE a2.3
@506 /* I still have places to go. You won't like Jey'Re's men entering the palace on your heels, will you? */ 
= @507 /* Oh, and give my regards to the githyanki. Did I mention they've set an ambush right past the first barrier? */ 
DO ~SetGlobal("O#LLQuest","GLOBAL",25)
EraseJournalEntry(@10022)
AddJournalEntry(@10023,QUEST)
DestroySelf()~
EXIT

// 3. The door to Jarlaxle and the wardstone.

CHAIN IF ~Global("O#LLQuestPalace","GLOBAL",2)~ THEN O#LLARTE a3
@508 /* So, you've killed the Matron Mother. Good for you. */ 
END
++ @509 /* Where have you been? Where's Kimmuriel? */ EXTERN O#LLARTE a3.1
++ @510 /* You could have lent a hand, you know. */ EXTERN O#LLARTE a3.1
++ @511 /* Not bad, huh? */ EXTERN O#LLARTE a3.1

CHAIN O#LLARTE a3.1
@512 /* There is a nasty fight outside. Oblodra nearly fell under all those drow bodies. Luckily for him, in this venture he has a pet assassin. */ 
END
++ @513 /* You've got each other's backs, I see. Too bad nobody watches mine. */ EXTERN O#LLARTE a3.2
++ @514 /* So... what now? */ EXTERN O#LLARTE a3.2

CHAIN O#LLARTE a3.2
@515 /* Find the wardstone to the treasury. Oblodra and I will cover your back. */ 
DO ~SetGlobal("O#LLQuestPalace","GLOBAL",3)
EraseJournalEntry(@10023)
AddXPObject(Player1,30000)
AddXPObject(Player2,30000)
AddXPObject(Player3,30000)
AddXPObject(Player4,30000)
AddXPObject(Player5,30000)
AddXPObject(Player6,30000)
DestroySelf()~
EXIT

/* =====================================================

		Matron's son, Lorn Jeven

===================================================== */

CHAIN IF ~Global("O#LLQuest","GLOBAL",19)~ THEN O#LLMATR k4
@516 /* Oblodra. And the Bhaalspawn. Such a lovely duo. Enjoying yourselves after betraying me, I trust? */ 
DO ~SetGlobal("O#LLQuest","GLOBAL",20)
AddJournalEntry(@10021,QUEST)~
== O#LLKIMM @517 /* (An invisible shield suddenly squeezes your temples. It is weightless, but uncomfortable and almost too tight to breathe. You realize that Kimmuriel created it to prevent the Matron Mother from discovering Jarlaxle's and House Baenre's intent to kill her.) */
== O#LLKIMM @518 /* Not in the slightest, Matron Mother. */ 
== O#LLMATR @519 /* No? How shall I call it, then? You killed my captain, plotted against githyanki behind my back, secured an alliance with illithids - is there anything else that I don't know? */  
== O#LLKIMM @520 /* The githyanki were about to invade your home in search of... a certain former mercenary of ours. I neutralized them. As for the captain... do I need to continue? */ 
== O#LLMATR @521 /* By the Queen, no. He was a nonentity, and I'm well rid of him. Yet your actions were too independent for a mere male. And you, Bhaalspawn... what am I to do with you? */ 
END
+ ~Gender(Player1,MALE)~ + @522 /* Whatever you like, of course. I am *all* at your command. */ EXTERN O#LLMATR k4.4
+ ~Gender(Player1,FEMALE)~ + @523 /* Your captain tried to rape me. */ EXTERN O#LLMATR k4.1
++ @524 /* I did all your captain asked of me, and all he wanted was to kill me in return. */ EXTERN O#LLMATR k4.2
++ @525 /* I am ready to serve you, Matron Mother. */ EXTERN O#LLMATR k4.3
++ @526 /* I agree with Kimmuriel. We served your interests. */ EXTERN O#LLMATR k4.5
++ @527 /* You may need us for the rival house attack. I killed several spies already. */ EXTERN O#LLMATR k4.6

CHAIN O#LLMATR k4.1
@528 /* And he didn't succeed? With an untrained and soft surface girl like you? He must have truly been a weakling. */
END
IF ~~ EXTERN O#LLMATR k4.task

CHAIN O#LLMATR k4.2
@529 /* Naturally. He thought you were trying to take his place. Weren't you, sweet thing? */
END
IF ~~ EXTERN O#LLMATR k4.task

CHAIN O#LLMATR k4.3
@530 /* As you should be. But I have more than enough obedient slaves: what I need is initiative. Although not *too* much, or even Oblodra's powers of the mind won't save your skin. */
END
IF ~~ EXTERN O#LLMATR k4.task

CHAIN O#LLMATR k4.4
@531 /* Are you, now? My girl in the lust chambers was not enough for you, I see. Or did you even visit her? I forgot to ask. */
= @532 /* Alas, I do not sleep with surface men, but if I was, I'm sure we both would have gotten... many new experiences. */
END
IF ~~ EXTERN O#LLMATR k4.task

CHAIN O#LLMATR k4.5
@533 /* You shouldn't trust Kimmuriel Oblodra too much. Should <PRO_HESHE>, Kimmuriel? */
END
IF ~~ EXTERN O#LLMATR k4.task

CHAIN O#LLMATR k4.6
@534 /* Indeed you have, and I may well need you for more - or kill you now, before your blade becomes another dagger in my back. I haven't decided yet. */
END
IF ~~ EXTERN O#LLMATR k4.task

CHAIN O#LLMATR k4.task
@535 /* What are you hiding from me, by the way? Yes, Bhaalspawn, I saw you wincing. Oblodra raised his mental shields for you, didn't he? Curious... but if you *are* plotting against me, the barriers won't help you much. */ 
== O#LLMATR @536 /* A task, then, to prove your loyalty. My son Lorn made a move against me. He is well-liked in the house, yet instead of hoarding his influence, he squanders it aimlessly. He wants more freedom for males, speaks against his sisters - he has even created a mercenary band of his own! */ 
== O#LLKIMM @537 /* Atrocious, no doubt. */ 
== O#LLMATR @538 /* Silence! He must die. Find him at the largest platform, where he's celebrating with his mercenary "friends", and kill him quickly. And this time, I won't have promises and lies: I will have his head. Do it, or my favor ends. */ 
DO ~AddJournalEntry(@10021,QUEST)
ApplySpell("O#LLMATR",DRYAD_TELEPORT)
ApplySpell("O#LLGUA3",DRYAD_TELEPORT)
ApplySpell("O#LLGUA4",DRYAD_TELEPORT)~
EXIT

// Lorn 

BEGIN O#LLLORN

CHAIN IF ~Global("O#LLQuest","GLOBAL",20)~ THEN O#LLLORN l1
@539 /* A surfacer? Who are you? ... Ah. Mother said she had a child of a dead surface god at her beck and call. You are a little old for a child, however. */ 
END
++ @540 /* I am <CHARNAME> the Bhaalspawn, and your mother sent me here to kill you. */ EXTERN O#LLLORN l1.1
++ @541 /* Bhaal was not just some "dead surface god". He was the Lord of Murder. Got the hint? */ EXTERN O#LLLORN l1.1
++ @542 /* Do you know why I am here? */ EXTERN O#LLLORN l1.1

CHAIN O#LLLORN l1.1
@543 /* You are here to dispose of me, of course. My dear mother read my letters, didn't she? Strategic plans for the expansion of my mercenary band, joining Bregan D'aerthe, robbing the house's treasury... */ 
== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @544 /* You're not a v-very loyal son... but maybe she wasn't a very good mother, either. */
== CERNDJ IF ~InParty("Cernd") InMyArea("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN @545 /* A pack of wolves is never at peace when the alpha is lacking. It seems that your mother was not the best of leaders. */
== JANJ IF ~InParty("Jan") InMyArea("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN @546 /* Reminds me of... actually, I don't think I have any relatives like that. */
== KORGANJ IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @547 /* Good on you, lad! Too bad we have to kill ye before that treasury joint, aye? */
== MAZZYJ IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @548 /* Despicable. And you didn't even once stop to consider that she was your mother? */
== O#LLLORN @549 /* Speaking of which, did I mention that I have the third wardstone, the one that leads straight to my mother's chambers? Would it be too presumptuous of me to expect that you'd be interested in a certain type of barter? Say, my life and service in exchange for the stone? */ 
DO ~SetGlobal("O#LLQuest","GLOBAL",21)
ClearAllActions()
StartCutSceneMode()
StartCutScene("O#LLCut6")~
EXIT

CHAIN IF ~Global("O#LLQuest","GLOBAL",21)~ THEN O#LLKIMM l2
@550 /* Perhaps we are. We should talk about it some more - in private. */ 
== O#LLLORN @551 /* Kimmuriel! What an unexpected surprise. Er... I am a dead man, am I? */ 
== O#LLKIMM @552 /* I'm afraid so, one way or another. Do you have anyone you don't fully trust? Call them now. */ 
== O#LLLORN @553 /* Why? But very well. Isterin! Come here at once! */ 
DO ~SetGlobal("O#LLQuest","GLOBAL",22)
AddXPObject(Player1,30000)
AddXPObject(Player2,30000)
AddXPObject(Player3,30000)
AddXPObject(Player4,30000)
AddXPObject(Player5,30000)
AddXPObject(Player6,30000)
ClearAllActions()
StartCutSceneMode()
StartCutScene("O#LLCut7")~
EXIT

CHAIN IF ~Global("O#LLQuest","GLOBAL",22)~ THEN O#LLKIMM l3
@554 /* There. Now he looks exactly like you, and his head should suffice for the Matron Mother. */ 
= @555 /* Go and hide. After we deal with House Jeven, a place in Bregan D'aerthe will await you. */ 
END
++ @556 /* Are you sure the Matron Mother won't recognize the ruse? */ EXTERN O#LLKIMM l3.1
++ @557 /* Nicely done. What now? */ EXTERN O#LLKIMM l3.2
++ @558 /* I still think we should kill the real Lorn, as well, to be sure. */ EXTERN O#LLKIMM l3.3

CHAIN O#LLKIMM l3.1
@559 /* Unless she sees Lorn walking past her, she won't. */
END
IF ~~ EXTERN O#LLKIMM l3.2

CHAIN O#LLKIMM l3.2
@560 /* I shall take my leave. Take the wardstone. Our assault on the palace will begin shortly: meet Entreri near the first barrier. If his search went smoothly, he would know where the first wardstone was hidden. */ 
DO ~SetGlobal("O#LLQuest","GLOBAL",23)
EraseJournalEntry(@10021)
AddJournalEntry(@10022,QUEST)
GiveItemCreate("O#LW3",Player1,1,0,0)
ActionOverride("O#LLLORN", ApplySpell(Myself,DRYAD_TELEPORT))
ApplySpell(Myself,DRYAD_TELEPORT)~
EXIT

CHAIN O#LLKIMM l3.3
@561 /* No. He is an asset to Bregan D'aerthe. */
END
IF ~~ EXTERN O#LLKIMM l3.2

/* =====================================================

		Jey'Re Jeven, first wardstone

===================================================== */

BEGIN O#LLJEY

CHAIN IF ~Global("O#LLQuest","GLOBAL",26)~ THEN O#LLJEY j1
@562 /* Bhaalspawn. What are you doing here? */ 
END
++ @563 /* What do you think? */ EXTERN O#LLJEY j1.1
++ @564 /* I am here to kill you. */ EXTERN O#LLJEY j1.1
++ @565 /* Shut up and die! */ EXTERN O#LLJEY j1.1

CHAIN O#LLJEY j1.1
@566 /* (groan) So you *are* a traitor, in league with that sadistic bastard Kimmuriel. You idiot! */
END
++ @567 /* I'm actually pretty clever. */ EXTERN O#LLJEY j1.2
++ @568 /* What do you mean? */ EXTERN O#LLJEY j1.2
++ @569 /* And you are a corpse. */ EXTERN O#LLJEY j1.2

CHAIN O#LLJEY j1.2
@570 /* House Jeven is under attack! Enemy forces are flooding the passages as we talk! Yesterday we only had House Baenre's disfavor, but now a rival house is about to destroy us utterly! */
== O#LLJEY @571 /* And, of course, it is a perfect moment for you and Bregan D'aerthe to turn against us. Amazing. But you're a fool if you think that Jey'Re Jeven gives up easily. */
END
++ @572 /* By the way, would you like to join Bregan D'aerthe? I only need your wardstone. */ EXTERN O#LLJEY j1.3
++ @573 /* Give up the wardstone, and your death will be quick. */ EXTERN O#LLJEY j1.3
++ @574 /* It does not matter. You will die, and I will have the wardstone. */ EXTERN O#LLJEY j1.3

CHAIN O#LLJEY j1.3
@575 /* The wardstone, you say? */
= @576 /* Well, you'll get it over my dead body. Men, to me! */
DO ~SetGlobal("O#LLQuest","GLOBAL",27)
AddExperienceParty(6000)
AddJournalEntry(@10024,QUEST)
Enemy()~
EXIT

/* =====================================================

	Githyanki ambush past the wardstone

===================================================== */

BEGIN O#LLGIW

CHAIN IF ~True()~ THEN O#LLGIW w1
@577 /* We found the location of the Silver Sword. Another thief had it, not Jarlaxle: we were wrong. So much time and effort lost... so many dead. Foolish. */ 
== HAERDAJ IF ~InParty("Haerdalis") InMyArea("Haerdalis") !StateCheck("Haerdalis",CD_STATE_NOTVALID)~ THEN @578 /* And our bargains with those squids were all for naught? Fascinating, my raven. Entropy at work. */
== KELDORJ IF ~InParty("Keldorn")InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @579 /* We should have never involved ourselves, <CHARNAME>. But it is good to know Jarlaxle was not the culprit. */
== MINSCJ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @580 /* So we will shake hands with friendly githyanki, drink some ale and leave! Right, Boo? */
== NALIAJ IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @581 /* Oh, for the love of Mystra, not again! */
== VICONIJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @582 /* Pheh. Idiots. Jarlaxle fooled them without even knowing it. */
== O#LLGIW @583 /* But you will not live to tell about our mistake! Die in the name of Gith! */
DO ~ActionOverride("O#LLGIW1",Enemy())
ActionOverride("O#LLGIW2",Enemy())
ActionOverride("O#LLGIW3",Enemy())
ActionOverride("O#LLGIW4",Enemy())
Enemy()~
EXIT

/* =====================================================

	Matron Mother's chambers: final battle

===================================================== */

// First chamber: priestess and two Elder Orbs - no extra dialogue

// Second chamber: Matron Mother

CHAIN IF ~Global("O#LLQuestPalace","GLOBAL",1) Global("O#LLQuestPalaceMatron","GLOBAL",0)~ THEN O#LLMATR m0
@584 /* So nice of you to destroy the invading army. Too bad my priestess did not survive, but she was expendable. Everyone is. */ 
DO ~SetGlobal("O#LLQuestPalaceMatron","GLOBAL",1)~
== O#LLMATR @585 /* I do not see Oblodra with you. Predictable, isn't he? Never gets his own hands dirty. But it suits me. Now you are all mine. */ 
END
++ @586 /* I don't want to kill you. Just return Jarlaxle to us. */ EXTERN O#LLMATR m0.1
+ ~Gender(Player1,MALE)~ + @587 /* And you are all mine. */ EXTERN O#LLMATR m0.2
++ @588 /* And you are so dead. */ EXTERN O#LLMATR m0.3

CHAIN O#LLMATR m0.1
@589 /* You'll join him in an instant. I have just the spell. You'll make the most wonderful statue. */
END
IF ~~ EXTERN O#LLMATR m0.3

CHAIN O#LLMATR m0.2
@590 /* And now that we so utterly and completely belong to each other... */
END
IF ~~ EXTERN O#LLMATR m0.3

CHAIN O#LLMATR m0.3
@591 /* Shall we dance? */ 
DO ~ActionOverride("O#LLGUA1",Enemy())
ActionOverride("O#LLGUA2",Enemy())
ActionOverride("O#LLGUA3",Enemy())
ActionOverride("O#LLGUA4",Enemy())
ActionOverride("O#LLGUA5",Enemy())
ActionOverride("O#LLGUA6",Enemy())
Enemy()~
EXIT

// Third chamber: treasury

CHAIN IF WEIGHT #-1 ~Global("O#LLQuestFinale","GLOBAL",1)~ THEN O#LLKIMM m1
@592 /* This is unexpected. Stone likeness of Jarlaxle? */ 
== O#LLARTE @593 /* A medusa's work, no doubt. Do you have a cure? */ 
== O#LLKIMM @594 /* What do you think? */ 
DO ~SetGlobal("O#LLQuestFinale","GLOBAL",2)
ClearAllActions()
StartCutSceneMode()
StartCutScene("O#LLCut9")~
EXIT

BEGIN O#LLJARL

CHAIN IF ~Global("O#LLQuestFinale","GLOBAL",2)~ THEN O#LLJARL j1
@595 /* What a welcome surprise! I don't suppose any of you bothered to bring drinks? */ 
DO ~SetGlobal("O#LLQuestFinale","GLOBAL",3)
AddXPObject(Player1,60000)
AddXPObject(Player2,60000)
AddXPObject(Player3,60000)
AddXPObject(Player4,60000)
AddXPObject(Player5,60000)
AddXPObject(Player6,60000)~
== O#LLKIMM @596 /* Later. You are in no condition to overindulge right now. */ 
== O#LLJARL @597 /* And you would know, my cerebral friend. How fares Bregan D'aerthe? Oh, but you haven't brought our men with you. Instead... Artemis, you braved the depths of the Underdark for me, and returned to Menzoberranzan, the same city you loathe so much? I am truly touched. And is it Veldrin of Ched Nasad or <CHARNAME> the Bhaalspawn that I see? */ 
END
+ ~Global("JarlaxleHQ","GLOBAL",0)~ + @1132 /* You must be Jarlaxle, I presume. Nice to finally meet you. */ EXTERN O#LLJARL j1.1
+ ~Global("RE_JarlaxleFlirt","GLOBAL",1)~ + @1133 /* I see you remember me well after our little romantic adventure. Now, how about rewarding your beautiful savior? */ EXTERN O#LLJARL j1.1
+ ~GlobalGT("JarlaxleHQ","GLOBAL",0)~ + @598 /* It has always been <CHARNAME> the Bhaalspawn, and you know it. */ EXTERN O#LLJARL j1.1
++ @599 /* Jarlaxle. Good to see our mission wasn't for nothing. */ EXTERN O#LLJARL j1.1
++ @600 /* Alive, well and waiting for <PRO_HISHER> reward. */ EXTERN O#LLJARL j1.1

CHAIN O#LLJARL j1.1
@601 /* We'll get to your reward in a moment. And it will be substantial, believe me. But first I'd like to thank you - all of you. My friends, I solemnly swear: should any of you find themselves in my former predicament, I shall do the same for you in return. */ 
== O#LLARTE @602 /* Me, turned to stone in some godforsaken castle? I'll never do anything as silly. */ 
== O#LLJARL @603 /* Even while defending a friend? Or someone you love? */ 
== O#LLARTE @604 /* (scoff) Love? What is that? */ 
== O#LLJARL @605 /* A marvelous feeling, my gloomy friend. But I bet our Bhaalspawn comrade-in-arms has no time for philosophical debates. Rather, the Child of Bhaal wishes to be left alone with the treasury, am I right? */ 
END
++ @606 /* Very much so. */ EXTERN O#LLJARL j1.2
++ @607 /* Well... let's just say I wouldn't mind if it happened. */ EXTERN O#LLJARL j1.2
++ @608 /* Oh, don't mind me. Carry on. Brotherhood of men and drow... I get it. */ EXTERN O#LLJARL j1.2

CHAIN O#LLJARL j1.2
@609 /* This is exactly what we'll do, then. The treasury is yours, but mind the traps and don't approach the exit - I think I saw a demilich peeking in. */ 
== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @610 /* Finally, our task is over. Collect your reward quickly, <CHARNAME> - it's high time we returned home and fought the battle for your soul. */
== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @611 /* The treasury is mine! Mine! Er, I meant, yours, of course. Of course. */
== IMOEN2J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @612 /* At last! Yay! <CHARNAME>, we did it! Here, let me check for traps... */
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @613 /* It was a dangerous mission, <CHARNAME>. I am glad it ended without serious cost. */
== VALYGARJ IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN @614 /* Everyone got what they wanted, I suppose. I do not approve of this place, or some of Oblodra's methods... but it was wrong to keep Jarlaxle here in this state. It feels good that we freed him. */
== O#LLJARL @615 /* In the meantime, Kimmuriel and I have things we need to discuss, and then we'll be on the road again. What say you, Artemis? */ 
== O#LLARTE @616 /* We'll see. */ 
== O#LLJARL @617 /* Spoken like a true soldier of fortune. Now, let the looting begin! Approach Kimmuriel when you are finished: I think he'll be too happy to kick us all out of here. */ 
EXIT

CHAIN IF ~Global("O#LLQuestFinale","GLOBAL",3)~ THEN O#LLARTE a21
@618 /* Speak to Oblodra if you're done. */ 
EXIT

CHAIN IF ~Global("O#LLQuestFinale","GLOBAL",3)~ THEN O#LLJARL j21
@619 /* Done already? Talk to Kimmuriel, then. */ 
EXIT

CHAIN IF WEIGHT #-1 ~Global("O#LLQuestFinale","GLOBAL",3)~ THEN O#LLKIMM k21
@620 /* Are you ready to leave, Child of Bhaal? */ 
END
++ @621 /* Ready and eager. */ EXTERN O#LLKIMM k21.1
++ @622 /* I shall miss you all a little. */ EXTERN O#LLKIMM k21.2
++ @623 /* No, not yet. */ EXIT

CHAIN O#LLKIMM k21.1
@624 /* Good. I was right when I chose you for the mission. Your lack of sentimentality will serve you well. */ 
END 
IF ~~ EXTERN O#LLKIMM k21.3

CHAIN O#LLKIMM k21.2
@625 /* Sentimentality is not the best quality in a future deity. But our work together has indeed been... efficient. */ 
END 
IF ~~ EXTERN O#LLKIMM k21.3

CHAIN O#LLKIMM k21.3
@626 /* This is it, then. Goodbye. Perhaps one day we shall meet again. */ 
== O#LLJARL @627 /* Don't even doubt it. Once this business with your dead father is over with, of course. Wouldn't want to meddle. */ 
== O#LLARTE @628 /* Jarlaxle, shut up. */ 
DO ~SetGlobal("O#LLQuest","GLOBAL",100)
EraseJournalEntry(@10002)
EraseJournalEntry(@10003)
EraseJournalEntry(@10004)
EraseJournalEntry(@10005)
EraseJournalEntry(@10006)
EraseJournalEntry(@10007)
EraseJournalEntry(@10008)
EraseJournalEntry(@10010)
EraseJournalEntry(@10011)
EraseJournalEntry(@10012)
EraseJournalEntry(@10015)
EraseJournalEntry(@10017)
EraseJournalEntry(@10019)
EraseJournalEntry(@10021)
EraseJournalEntry(@10022)
EraseJournalEntry(@10023)
EraseJournalEntry(@10024)
AddJournalEntry(@10025,QUEST_DONE)
ClearAllActions()
StartCutSceneMode()
StartCutScene("O#LLCut1")~
EXIT

/* =====================================================

		SUBQUESTS START HERE

	ALL ADDITIONAL "CITY" DIALOGUE IS HERE

===================================================== */

/* =====================================================

		Male fighters (captain)

===================================================== */

BEGIN O#LLFIG1 // Jergan, hi!
BEGIN O#LLFIG2 // K'Hui - don't laugh
BEGIN O#LLFIG3 // Vintul
BEGIN O#LLFIG4
BEGIN O#LLFIG5
BEGIN O#LLFIG6
BEGIN O#LLFIGM // Mas'sai

CHAIN IF ~Global("O#LLFIG1","GLOBAL",1)~ THEN O#LLFIG1 f1
@629 /* What are you doing here, surfacer? Leave. */
END
IF ~~ EXTERN O#LLFIG3 f1.1

CHAIN IF ~Global("O#LLFIG1","GLOBAL",1)~ THEN O#LLFIG2 f2
@630 /* This does not concern you, surface scum. Keep walking. */
END
IF ~~ EXTERN O#LLFIG3 f1.1

CHAIN IF ~Global("O#LLFIG1","GLOBAL",1)~ THEN O#LLFIG3 f3
@631 /* Aha! A neutral party! */
END
IF ~~ EXTERN O#LLFIG3 f1.1

CHAIN O#LLFIG3 f1.1
@632 /* Heed me, you two. We'll solve this argument in no time! */
DO ~SetGlobal("O#LLFIG1","GLOBAL",2)~
== O#LLFIG2 @633 /* By killing this <PRO_RACE> together? */
== O#LLFIG1 @634 /* I like the idea. */
== O#LLFIG3 @635 /* No. We'll ask this slave's opinion. */
END
++ @636 /* I'd like to know what is going on here, first. */ EXTERN O#LLFIG3 f1.2
++ @637 /* Why are you fighting? */ EXTERN O#LLFIG3 f1.2
++ @638 /* I'm not a slave! */ EXTERN O#LLFIG1 f1.1a

CHAIN O#LLFIG1 f1.1a
@639 /* Do you think we care? */
END
IF ~~ EXTERN O#LLFIG3 f1.2

CHAIN O#LLFIG3 f1.2
@640 /* Jergan and K'hui, here, fought a duel to the death a year ago. So, when the championship started, they sought each other out quite violently. */
== O#LLFIG1 @641 /* And I won! */
== O#LLFIG2 @642 /* By the Spider Queen's black pits, you didn't! I am the true champion! */
== O#LLFIG3 @643 /* See, surfacer? And, of course, there's me. I, Vintul, insist they both cheated, so my third place is actually the first, and I am the real winner. */
END
++ @644 /* How did they cheat? */ EXTERN O#LLFIG3 f1.3
++ @645 /* Isn't cheating in duels fair game? You're not some pansy paladins of Torm, after all. */ EXTERN O#LLFIG3 f1.3
++ @646 /* Tell me more. */ EXTERN O#LLFIG3 f1.3

CHAIN O#LLFIG3 f1.3
@647 /* Cheating is basically a clever interpretation of the rules, but the final match lacked any subtlety. */
= @648 /* Jergan raised his sword more slowly than a darthiir runs away from a sword spider. And K'hui just fell - didn't even try to block a simple strike. Both of them dueled brilliantly before. */
== O#LLFIG2 @649 /* He used magic! One of his buddies from Sorcere... */
== O#LLFIG1 @650 /* I am the best fighter of this house! I don't put up with those stuck-up morons... most brilliant wizards... hello, Master Xorlarrin... */
== O#LLFIG3 @651 /* No sorcery: neither had any wizards helping them, they swear. */
END
++ @652 /* And? Anyone can swear to anything. */ EXTERN O#LLFIG3 f1.5
++ @653 /* What about you, Vintul? Did you or your friends cast a slow spell on these two? */ EXTERN O#LLFIG3 f1.4
++ @654 /* It could be some other wizard. */ EXTERN O#LLFIG3 f1.5
++ @159 /* Let me think about this. */ EXTERN O#LLFIG3 f1.5
++ @655 /* I've solved this. Jergan obviously cheated: he won, after all. */ EXTERN O#LLFIG3 f1.jergan
++ @656 /* I have a ready solution. It's very simple: they both cheated. */ EXTERN O#LLFIG3 f1.both

CHAIN O#LLFIG3 f1.4
@657 /* Believe me, I'd like to. But summoning a couple of imps to break their concentration? That's style. A simple slowing spell? Pathetic. */
END
IF ~~ EXTERN O#LLFIG3 f1.5

CHAIN O#LLFIG3 f1.5
@658 /* It could be someone else... perhaps. But why? The Matron Mother was watching. Who'd be an idiot enough to spoil her fun? */
== O#LLFIG2 @659 /* You're wasting your time, Vintul. Would you trust our championship's fate to a surfacer? */
== O#LLFIG1 @660 /* I'm tired of standing here and arguing. If this <PRO_RACE> fails to solve this, we'll feed <PRO_HIMHER> to the spiders. Problem solved. */
== O#LLFIG3 @661 /* Sounds good. So, it is in your hands, surfacer. Come back when you solve this, if you dare. */
EXIT

CHAIN IF ~Global("O#LLFIG1","GLOBAL",2)~ THEN O#LLFIG1 f2.1
@662 /* What? What do you want? */
END
+ ~CheckStatGT(Player1,17,INT)~ + @663 /* Your lies will not divert me from my path, Jergan. I am intelligent enough to see through them. Tell me the truth. */ EXTERN O#LLFIG1 f2.2
+ ~CheckStatGT(Player1,17,WIS)~ + @664 /* I am wise enough to see your wishes and desires, Jergan. You wanted this victory. Tell me the truth. */ EXTERN O#LLFIG1 f2.2
+ ~CheckStatGT(Player1,17,CHR)~ + @665 /* Come on, Jergan, you can see I'm harmless. Tell me the truth. */ EXTERN O#LLFIG1 f2.2
++ @666 /* Did you cheat, Jergan? */ EXTERN O#LLFIG1 f2.11
++ @667 /* Nothing. */ EXIT

CHAIN O#LLFIG1 f2.11
@668 /* No! Leave me be. */
EXIT

CHAIN O#LLFIG1 f2.2
@669 /* I never needed to cheat! I was... I was going to impress the Matron Mother. It is common knowledge she's searching for a new male, and I am the best fighter of House Jeven, virile and strong. But that cursed spell ruined everything! */
= @670 /* Find the mage. Find the mage and bring him to me, and I'll cut his throat into ribbons! No spell will help him there. */
EXIT

CHAIN IF ~Global("O#LLFIG1","GLOBAL",2)~ THEN O#LLFIG2 f2.2
@671 /* You again. Must you hover about, surfacer? */
END
+ ~CheckStatGT(Player1,17,INT)~ + @672 /* Your lies will not divert me from my path, K'hui. I am intelligent enough to see through them. Tell me the truth. */ EXTERN O#LLFIG2 f2.22
+ ~CheckStatGT(Player1,17,WIS)~ + @673 /* I am wise enough to see your wishes and desires, K'hui. You wanted this victory. Tell me the truth. */ EXTERN O#LLFIG2 f2.22
+ ~CheckStatGT(Player1,17,CHR)~ + @674 /* Come on, K'hui, you can see I'm harmless. Tell me the truth. */ EXTERN O#LLFIG2 f2.22
+ ~Global("O#LLMassaiConfessed","GLOBAL",1)~ + @675 /* Mas'sai confessed. You cheated, K'hui. */ EXTERN O#LLFIG2 f2.3
++ @676 /* Did you cheat, K'hui? */ EXTERN O#LLFIG2 f2.1
++ @667 /* Nothing. */ EXIT

CHAIN O#LLFIG2 f2.1
@677 /* Even if I did, do you think I'd tell you? Idiot. */
EXIT

CHAIN O#LLFIG2 f2.22
@678 /* I... I lost. Why would I cheat? */
END
++ @679 /* To make sure everyone thought the match was a sham. You knew you couldn't beat Jergan fairly, could you? */ EXTERN O#LLFIG2 f2.3
++ @680 /* You tell me. */ EXTERN O#LLFIG2 f2.1

CHAIN O#LLFIG2 f2.3
@681 /* I... maybe, but... */
== O#LLFIG1 @682 /* You scum! You dirty, lying filth! */
== O#LLFIG3 @683 /* He will be despised, no doubt. Let's take him to the priestesses. They'll find his mage ally in no time. And you, surfacer, are allowed to escape with your life. Be grateful for it. */
DO ~SetGlobal("O#LLFIG1","GLOBAL",3)
AddJournalEntry(@10004,QUEST)
AddExperienceParty(4000)
ActionOverride("O#LLFIGM",EscapeArea())
ActionOverride("O#LLFIG1",EscapeArea())
ActionOverride("O#LLFIG2",EscapeArea())
ActionOverride("O#LLFIG4",EscapeArea())
ActionOverride("O#LLFIG5",EscapeArea())
ActionOverride("O#LLFIG6",EscapeArea())
EscapeArea()~
EXIT

CHAIN IF ~Global("O#LLFIG1","GLOBAL",2)~ THEN O#LLFIG3 f2.3
@684 /* So, surfacer, have you found who the culprit is? */
END
++ @685 /* Were there any mages on the platform during the championship? */ DO ~SetGlobal("O#LLMassaiNamed","GLOBAL",1)~ EXTERN O#LLFIG3 f2.3a
+ ~Global("O#LLMassaiConfessed","GLOBAL",1)~ + @686 /* K'hui cheated. Mas'sai told me K'hui hired him. */ EXTERN O#LLFIG3 f1.khui
++ @687 /* I think you cheated, Vintul. */ EXTERN O#LLFIG3 f1.vintul
++ @688 /* Obviously, Jergan cheated: he won, after all. */ EXTERN O#LLFIG3 f1.jergan
++ @689 /* It's very simple. They both cheated. */ EXTERN O#LLFIG3 f1.both
++ @690 /* I have nothing to report, yet. */ EXIT

CHAIN O#LLFIG3 f2.3a
@691 /* Indeed. Mas'sai stood very near to Jergan all the time. Talk to him, if you wish. */
EXIT

CHAIN O#LLFIG3 f1.vintul
@692 /* Me? And you have proof, of course? Or do you expect I'll confess? */
END
IF ~~ EXTERN O#LLFIG1 f1.wrong

CHAIN O#LLFIG3 f1.jergan
@693 /* Jergan? One of the stupidest... ahem, I meant the strongest fighters? Why would he do such a thing? Or did he confess? */
END
IF ~~ EXTERN O#LLFIG1 f1.wrong

CHAIN O#LLFIG3 f1.both
@694 /* This is what I keep saying, but your words are useless without proof - or a confession. */
END
IF ~~ EXTERN O#LLFIG1 f1.wrong

CHAIN O#LLFIG3 f1.khui
@695 /* Interesting. K'hui, is this true? */
== O#LLFIG2 @696 /* No! */
== O#LLFIG1 @697 /* Really? Even though Mas'sai confessed? Did you do it or not, fool? */
END
IF ~~ EXTERN O#LLFIG2 f2.3

CHAIN O#LLFIG1 f1.wrong
@698 /* We are obviously wasting time here. This iblith has a kobold's brain. */
== O#LLFIG2 @699 /* True enough. Let's get out of here and gut some umber hulks. I'm itching for a good slaughter. */
== O#LLFIG3 @700 /* Indeed. Shall we start with the surfacer, here? */
== O#LLFIG2 @701 /* Why not? */
DO ~SetGlobal("O#LLFIG1","GLOBAL",4)
AddJournalEntry(@10005,QUEST)
ActionOverride("O#LLFIGM",ApplySpell(Myself,DRYAD_TELEPORT))
ActionOverride("O#LLFIG1",Enemy())
ActionOverride("O#LLFIG3",Enemy())
ActionOverride("O#LLFIG4",Enemy())
ActionOverride("O#LLFIG5",Enemy())
ActionOverride("O#LLFIG6",Enemy())
Enemy()~
EXIT

CHAIN IF ~RandomNum(2,1)~ THEN O#LLFIG4 f0.41
@702 /* Mas'sai is too interested in our matches. His muscles are too weak: he should be studying in Sorcere, not dreaming of a fighting career. */
EXIT

CHAIN IF ~RandomNum(2,2)~ THEN O#LLFIG4 f0.42
@703 /* Jergan's abilities picked the interest of the Matron Mother, but not after that last match. It was obvious he disappointed her. */
EXIT

CHAIN IF ~RandomNum(2,1)~ THEN O#LLFIG5 f0.51
@704 /* K'hui and Vintul are idiots. Everyone knew Jergan was a stronger fighter. Calling him a cheater is a death sentence. */
EXIT

CHAIN IF ~RandomNum(2,2)~ THEN O#LLFIG5 f0.52
@705 /* Do not interfere, surfacer. We will find the cheater without you. */
EXIT

CHAIN IF ~RandomNum(2,1)~ THEN O#LLFIG6 f0.61
@706 /* Vintul believes both champions cheated. I agree with him: K'hui always seemed shifty to me. */
EXIT

CHAIN IF ~RandomNum(2,2)~ THEN O#LLFIG6 f0.62
@707 /* Jergan wants to be the strongest warrior in the House. Ha! Now that the Matron thinks he is a cheater, his life is forfeit. */
EXIT

CHAIN IF ~!Global("O#LLFIG1","GLOBAL",2)~ THEN O#LLFIGM f4
@708 /* A graduate of Sorcere does not speak with surface scum. Off with you! */
EXIT

CHAIN IF ~Global("O#LLFIG1","GLOBAL",2)~ THEN O#LLFIGM f4.1
@709 /* What do you want, <PRO_MALEFEMALE>? Should I report you to the priestesses? */
END
++ @710 /* Or should I report you for cheating at the match? You're far too interested in these fighters' squabble. */ EXTERN O#LLFIGM f4.2
++ @711 /* I think you and I should talk about slowing spells and nasty things that happen when someone uses them when he shouldn't. */ EXTERN O#LLFIGM f4.2
+ ~Global("O#LLMassaiNamed","GLOBAL",1)~ + @712 /* Vintul told me that you were present at the match. You cast that spell, didn't you? */ EXTERN O#LLFIGM f4.2
++ @423 /* Never mind. */ EXIT

CHAIN O#LLFIGM f4.2
@713 /* I... I should go. Right now. There is urgent business in Sorcere that awaits me, so GET OUT OF MY WAY, surfacer! */
END
++ @714 /* Not so fast. The cavern is sealed, remember? */ EXTERN O#LLFIGM f4.3
++ @715 /* Don't even dream of it. */ EXTERN O#LLFIGM f4.3
++ @716 /* A squirming drow mage, begging me to pass. My day is complete. */ EXTERN O#LLFIGM f4.3
++ @717 /* All right. I'll just call those three fighters from over there. */ EXTERN O#LLFIGM f4.3

CHAIN O#LLFIGM f4.3
@718 /* (sigh) You just aren't letting go, are you? */
== O#LLFIGM @719 /* Very well. I did cast that slowing spell, if you wish to know. But only because K'hui forced me! He knew secrets of mine, secrets that I never... */
== O#LLFIGM @720 /* By the Spider Queen, you are going to take me to the priestesses, are you? Not in this lifetime, surfacer! */
DO ~SetGlobal("O#LLMassaiConfessed","GLOBAL",1)
ApplySpell("O#LLFIGM",DRYAD_TELEPORT)~
EXIT

/* =====================================================

		Rival spies (captain)

===================================================== */

BEGIN O#LLNELR
BEGIN O#LLSPY1
BEGIN O#LLSPY2
BEGIN O#LLSPY3
BEGIN O#LLSPY4

CHAIN IF ~Global("O#LLNELR","GLOBAL",0)~ THEN O#LLNELR l1
@721 /* I know of you. You are the Bhaalspawn, the young <PRO_MANWOMAN> who works for Kimmuriel. What are you doing here? We shouldn't be seen together. */
END
++ @722 /* I am here to warn you: the Matron Mother's people want you dead. You should disappear. */ DO ~SetGlobal("O#LLQuestC2","GLOBAL",2)~ EXTERN O#LLNELR l1.1
+ ~Global("O#LLQuestC2","GLOBAL",1)~ + @723 /* Kimmuriel asked me to send you to him. Now. */ DO ~SetGlobal("O#LLQuestC2","GLOBAL",2)~ EXTERN O#LLNELR l1.1
++ @724 /* I am here to kill you, but I am not going to do that. */ DO ~SetGlobal("O#LLQuestC2","GLOBAL",2)~ EXTERN O#LLNELR l1.1
++ @725 /* I am here to kill you. To arms! */ DO ~SetGlobal("O#LLQuestC2","GLOBAL",3)~ EXTERN O#LLNELR l1.2

CHAIN O#LLNELR l1.1
@726 /* Indeed? Thank you for warning me. And watch your back here, Bhaalspawn. */
DO ~AddExperienceParty(4000)
EscapeArea()~
EXIT

CHAIN O#LLNELR l1.2
@727 /* Betrayal! Bregan D'aerthe will avenge me, surfacer! */
DO ~Enemy()~
EXIT

CHAIN IF ~Global("O#LLSPY1","GLOBAL",0)~ THEN O#LLSPY1 s1
@728 /* Step away, surfacer. My services are not for you. */
END
++ @729 /* Services? Are you... a drow hooker? A woman? */ EXTERN O#LLSPY1 s1.1
++ @730 /* I don't care. I am here to snap a whore's neck. */ EXTERN O#LLSPY1 s1.2

CHAIN O#LLSPY1 s1.1
@731 /* What's it to you? Sod off! */
DO ~SetGlobal("O#LLSPY1","GLOBAL",1)~
EXIT

CHAIN O#LLSPY1 s1.2
@732 /* You crotch-sprog of a drider! */
DO ~Enemy()~
EXIT

CHAIN IF ~Global("O#LLSPY1","GLOBAL",1)~ THEN O#LLSPY1 s1.3
@733 /* Do you want me to touch you between your legs? Put my cool, light fingers on your chest? Run my tongue down your spine and fondle you until you're breathless? */
= @734 /* In your dreams, failure. */
EXIT

CHAIN IF ~Global("O#LLSPY2","GLOBAL",0)~ THEN O#LLSPY2 s2 
@735 /* What? I am busy. */
END
++ @736 /* You're not very polite. */ EXTERN O#LLSPY2 s2.1
++ @737 /* (Snap his neck quickly and quietly) */ EXTERN O#LLSPY2 s2.2

CHAIN O#LLSPY2 s2.1
@738 /* Go away and bother me no more! */
EXIT

CHAIN O#LLSPY2 s2.2
@739 /* Gherk! */
DO ~Kill(Myself)~
EXIT

CHAIN IF ~Global("O#LLSPY3","GLOBAL",0)~ THEN O#LLSPY3 s3
@740 /* Go away, filth, lest the priestesses flay you alive. */
DO ~SetGlobal("O#LLSPY3","GLOBAL",1)~
EXIT

CHAIN IF ~Global("O#LLSPY3","GLOBAL",1)~ THEN O#LLSPY3 s3.1
@741 /* Approach me again, and you are dead. */
DO ~SetGlobal("O#LLSPY3","GLOBAL",2)~
EXIT

CHAIN IF ~Global("O#LLSPY3","GLOBAL",2)~ THEN O#LLSPY3 s3.2
@742 /* I warned you! The spiders will devour your innards, <PRO_RACE>! */
DO ~SetGlobal("O#LLSPY3","GLOBAL",3) Enemy()~
EXIT

CHAIN IF ~Global("O#LLSPY4","GLOBAL",0)~ THEN O#LLSPY4 s4
@743 /* You! I know who you are! Don't - don't you come any closer! */
== O#LLSPY4 @744 /* Death to House Jeven! You shall never take me alive! */
DO ~SetGlobal("O#LLSPY4","GLOBAL",1) Enemy()~
EXIT

/* =====================================================

		Githyanki (Kimmuriel)

===================================================== */

BEGIN O#LLGITH
BEGIN O#LLGIT2
BEGIN O#LLGIT3
BEGIN O#LLGIT4

CHAIN IF ~Global("O#LLKimmurielTasks","GLOBAL",2) Global("O#LLKimmurielGithAttack","GLOBAL",1)~ THEN O#LLGITH g1.a
@745 /* The servant of the servant of the Kalach-Cha attacks! Jarlaxle, a wielder and a betrayer, sent his slave to fight his battles! Attack! For the Silver Sword! */ 
DO ~SetGlobal("O#LLKimmurielTasks","GLOBAL",3)
SetGlobal("O#LLKimmurielGithAttack","GLOBAL",2)
AddJournalEntry(@10008,QUEST)
ActionOverride("O#LLGIT2",Enemy())
ActionOverride("O#LLGIT3",Enemy())
ActionOverride("O#LLGIT4",Enemy())
Enemy()~
EXIT

CHAIN IF ~Global("O#LLKimmurielTasks","GLOBAL",2) !Global("O#LLKimmurielGithAttack","GLOBAL",1)~ THEN O#LLGITH g1
@746 /* Kalach-Cha! This one smells of the one who touched it! The one who talked to the one who wielded it! */ 
END
IF ~~ EXTERN O#LLGIT2 g1.0

CHAIN IF ~Global("O#LLKimmurielTasks","GLOBAL",2)~ THEN O#LLGIT2 g1.0
@747 /* Excuse my companion. He is a little restless. */ 
DO ~SetGlobal("O#LLKimmurielTasks","GLOBAL",3) AddJournalEntry(@10008,QUEST)~
== O#LLGITH @748 /* This one knows where the silver shard is! I can sense it! Kalach-Cha is nearby! */
== O#LLGIT2 @749 /* Oh, bother. Look, do you remember what happened when you accused the high priestess of Lolth of sleeping with the Kalach-Cha? */
== O#LLGITH @750 /* This one showed her the error of choosing her bed partners! And the Matron Mother had to pick another priestess! */
== O#LLGIT2 @751 /* Which didn't improve our standing one bit. (sigh) All right, we might as well ask. Tell me, stranger, do you wield any of the silver swords of the Gith, or perhaps parts of it? */
END
++ @752 /* Probably. You've got no idea what a mess my backpack is. */ EXTERN O#LLGIT2 g1.2
++ @753 /* Silver shards? Kalach-Cha? Sounds interesting. */ EXTERN O#LLGIT2 g1.2
++ @754 /* Ah... why are you asking? */ EXTERN O#LLGIT2 g1.2
++ @755 /* Look, I've been sent to kill you. So how about we cut the chatter and, you know, do it? */ EXTERN O#LLGITH g1.1

CHAIN O#LLGITH g1.1
@756 /* The is one is the servant of the servant of the Kalach-Cha! Jarlaxle! A wielder and a betrayer! Attack! */
== IMOEN2J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @757 /* Why does it always end like this? */
== JANJ IF ~InParty("Jan") InMyArea("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN @758 /* Oooh, Uncle Scratchy in the flesh! On one of his worse days, of course. */
== MINSCJ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @759 /* Boo would never betray anyone! He is the most honest, trusting, honorable hamster! Go for the eyes, Boo, go! */
== NALIAJ IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @760 /* Oh, bother... */
== VICONIJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @761 /* And I thought only surface-dwellers were this stupid. */
== O#LLGIT2 @762 /* What, again? Oh, very well, if you insist... */
DO ~ActionOverride("O#LLGITH",Enemy())
ActionOverride("O#LLGIT3",Enemy())
ActionOverride("O#LLGIT4",Enemy())
Enemy()~
EXIT

CHAIN O#LLGIT2 g1.2
@763 /* We are here to find a thief who happened to come across our blade. Not just any githyanki blade, but the Silver Sword. */
= @764 /* The thief is called the Kalach-Cha in our tongue. Judging by my companion's deductive powers - he spent too much in Limbo, but who cares? - the criminal and the mercenary named Jarlaxle are one and the same. Have you actually seen him? Or the Silver Sword? */
END
++ @765 /* Jarlaxle stole a priceless part of a silver sword? No, the Silver Sword? */ EXTERN O#LLGITH g1.3
++ @766 /* So, if I had a cool silver two-handed blade with a vorpal effect which wasn't the Silver Sword, I could just shove it into your face and you wouldn't care? */ EXTERN O#LLGITH g1.3
+ ~Gender(Player1,MALE)~ + @767 /* Have I seen Jarlaxle? I'm afraid not. */ EXTERN O#LLGITH g1.3
+ ~Gender(Player1,FEMALE)~ + @767 /* Have I seen Jarlaxle? I'm afraid not. */ EXTERN O#LLGITH g1.4
++ @768 /* I know where Jarlaxle is - the Matron Mother's treasury. Will you help me get inside? */ EXTERN O#LLGITH g1.5
++ @769 /* You know, I'm bored. How about I just kill you? */ EXTERN O#LLGITH g1.1

CHAIN O#LLGITH g1.3
@770 /* This one is mocking us! I can see the foul stench of this one's dark master on <PRO_HIMHER>! */
END
IF ~~ EXTERN O#LLGITH g1.1

CHAIN O#LLGITH g1.4
@771 /* Lies! ALL LIES! The Kalach-Cha must have slept with her, too! */
END
IF ~~ EXTERN O#LLGITH g1.1

CHAIN O#LLGITH g1.5
@772 /* Fool! Now that we know where the Kalach-Cha is, this one is of no use to us! */
END
IF ~~ EXTERN O#LLGITH g1.1

CHAIN IF ~True()~ THEN O#LLGIT3 g3
@773 /* Do not speak to me, <RACE>. I have come a long way and must meditate. */
EXIT

CHAIN IF ~True()~ THEN O#LLGIT4 g4
@774 /* You've talked to a psionic creature recently. An illithid? No... a drow. Curious. */
EXIT

/* =====================================================

		Illithids (Kimmuriel)

===================================================== */

BEGIN O#LLILL1
BEGIN O#LLILL2

CHAIN IF ~Global("O#LLKimmurielTasks","GLOBAL",4)~ THEN O#LLILL1 i1
@775 /* *What do you want, <PRO_RACE>?* */ 
END
++ @776 /* Erm... can you understand me? How do you talk? */ EXTERN O#LLILL1 i1.1
++ @777 /* I come in peace. I want an alliance. */ EXTERN O#LLILL1 i1.1
++ @778 /* Kimmuriel Oblodra sent me to negotiate with you. */ EXTERN O#LLILL1 i1.1

CHAIN O#LLILL1 i1.1
@779 /* *Your thoughts are clear. Foolish <PRO_RACE>, you have no protection.* */ 
= @780 /* *Wait. He of the former House Oblodra... Kimmuriel sent you. Images of him in your mind. Traces of his thoughts in your spine. He controls you.* */
END
++ @781 /* Liar. */ EXTERN O#LLILL1 i1.2
++ @782 /* No, he doesn't. He sent me here to secure an alliance. */ EXTERN O#LLILL1 i1.2
++ @783 /* And you are trying to manipulate me. */ EXTERN O#LLILL1 i1.2
++ @784 /* Really? */ EXTERN O#LLILL1 i1.2

CHAIN O#LLILL1 i1.2
@785 /* *You serve him. How else do you call it?* */ 
== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @787 /* Do not play with words, creature! Will you help or not? */
== HAERDAJ IF ~InParty("Haerdalis") InMyArea("Haerdalis") !StateCheck("Haerdalis",CD_STATE_NOTVALID)~ THEN @788 /* I suddenly feel a little light... My raven, do you truly wish to reveal our innermost thoughts to this creature? I confess, I do not find the experience pleasing. */
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @789 /* I thought they'd would be more concerned about the githyanki. Aren't they ancient enemies? */
== KORGANJ IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @790 /* The dark skin who puts gold in our purses and meat in me belly, sure enough! */
== O#LLILL1 @791 /* *Silence. I see our ancient enemy in your thoughts. Kalach-Cha... yes. They are here, and they are hunting. Kimmuriel was wise to leave your mind open to us.* */
= @792 /* *We will help. Do a service for us first. House Jeven warriors broke into our enclave and stole three brain golems. Destroy them.* */
END
++ @793 /* Where do I find these brain golems? */ EXTERN O#LLILL1 i1.3
++ @794 /* Very well, you have a deal. */ EXTERN O#LLILL1 i1.3
++ @795 /* And then you'll help? */ EXTERN O#LLILL1 i1.3

CHAIN O#LLILL1 i1.3
@796 /* *Kill the golems, and our alliance is secured. If you lie, I will see it in your mind.* */ 
== O#LLILL1 @797 /* *You will find the golems at the uppermost platform with a tower in the middle, to the left of the market. I wish you a slow death, <PRO_RACE>.* */
DO ~SetGlobal("O#LLKimmurielTasks","GLOBAL",5)~
EXIT

CHAIN IF ~Global("O#LLKimmurielTasks","GLOBAL",5)~ THEN O#LLILL1 i2
@798 /* *You return.* */ 
END
+ ~Dead("O#LLGOL1") Dead("O#LLGOL2") Dead("O#LLGOL3")~ + @799 /* I killed your golems. */ EXTERN O#LLILL1 i2.1
+ ~OR(3) !Dead("O#LLGOL1") !Dead("O#LLGOL2") !Dead("O#LLGOL3")~ + @799 /* I killed your golems. */ EXTERN O#LLILL1 i2.0
++ @423 /* Never mind. */ EXIT

CHAIN O#LLILL1 i2.0
@800 /* *You are wasting time, Kimmuriel's thrall. Go and kill the golems in earnest.* */
EXIT

CHAIN O#LLILL1 i2.1
@801 /* *Good. Then you are strong enough to slay the githyanki by yourself. Leave.* */ 
END
++ @802 /* What? */ EXTERN O#LLILL1 i2.2
++ @803 /* That wasn't what you promised! */ EXTERN O#LLILL1 i2.2
++ @804 /* You lying piece of slime! */ EXTERN O#LLILL1 i2.2
++ @505 /* All right. */ EXTERN O#LLILL1 i2.2

CHAIN O#LLILL1 i2.2
@805 /* *If you fight githyanki on your own and die, we will come to finish the job. This is all we offer.* */ 
== CERNDJ IF ~InParty("Cernd") InMyArea("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN @806 /* Better than nothing, but not by much. We should leave before they change their minds. */
== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @807 /* Not good enough! You are... hmph. There's no use, is there? Talking to you is like talking to a wall! (And I'll not have it. My dignity should remain intact.) */
== KELDORJ IF ~InParty("Keldorn")InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @808 /* It is still a valid result, my friend. Come on, let us tell Kimmuriel. */
== MAZZYJ IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @809 /* As I suspected. The squids have no true honor. */
== VALYGARJ IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN @810 /* There is no point in arguing with these creatures, <CHARNAME>. Let us go. */
== O#LLILL1 @811 /* *Leave now.* */
DO ~AddExperienceParty(6000)
SetGlobal("O#LLKimmurielTasks","GLOBAL",6)~
EXIT

CHAIN IF ~GlobalGT("O#LLKimmurielTasks","GLOBAL",5)~ THEN O#LLILL1 i3
@812 /* *You return. I have already drained your mind of thoughts and secrets. Leave.* */ 
EXIT

CHAIN IF ~True()~ THEN O#LLILL2 i2
@813 /* *Do not talk to me, <PRO_RACE>.* */ 
EXIT

/* =====================================================

		Brown drow (subquest)

===================================================== */

BEGIN O#LLRIEL
BEGIN O#LLBROW
BEGIN O#LLBRO2

CHAIN IF ~Global("O#LLPriestessBrown","GLOBAL",0)~ THEN O#LLRIEL r1
@814 /* You! Yes, you, <PRO_RACE>. Lolth demands your service! */
END
++ @815 /* Lolth demands many things. I do not worship her. */ EXTERN O#LLRIEL r1.1
++ @816 /* And what does your goddess want from me? */ EXTERN O#LLRIEL r1.1
++ @817 /* I am listening. */ EXTERN O#LLRIEL r1.1

CHAIN O#LLRIEL r1.1
@818 /* You surface types need money, yes? You will get some star sapphires for this service. Now listen closely. */
= @819 /* A dirty-haired whore who has no business to be called a goddess, Eilistraee, is plotting against the Spider Queen. Her servants are whispering about turning some of the drow into weak-hearted "dark elves" with brown skin and black hair. */
= @820 /* Can you imagine it, <PRO_RACE>? Can you even finish the thought without disgust? */
END
++ @821 /* Why not? It sounds beautiful. */ EXTERN O#LLRIEL r1.2
++ @822 /* Why would Eilistraee even want to do it? */ EXTERN O#LLRIEL r1.2
++ @823 /* And lose your beautiful silver hair and ebony skin? This Eilistraee is nuts! */ EXTERN O#LLRIEL r1.2
++ @824 /* Ugh. I'm going to kill these "servants" for aesthetic reasons alone. */ EXTERN O#LLRIEL r1.2

CHAIN O#LLRIEL r1.2
@825 /* Eilistraee's servants are spouting lies about some ancient curse that doesn't allow some of the drow to revert to their ancestral physiology. All lies! */
== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @826 /* I've heard of this curse. During the Crown Wars... I think. There might be some truth in... in what she says. */
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @827 /* Many demonic entities tried to seduce elves with their dark magic, before some of them even became drow. Alas, I do not know much more. */
== NALIAJ IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @828 /* My castle's library had a book about an ancient demonic lord, Wendonai. There may be a real curse, after all, <CHARNAME>, although it'd be too powerful for anyone but a god to lift. */
== VALYGARJ IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN @829 /* Curses. Magic. Lies. This place is worse than Spellhold. */
== VICONIJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @830 /* Interesting indeed. Let us find these "servants" and learn more. */
== O#LLRIEL @831 /* They want to splinter our race, divide and conquer. In Lolth's name, you shall destroy them, <PRO_RACE>! Go now, and find their lair on the lowest platform in the southeast. I want them dead, dead, dead! */
DO ~SetGlobal("O#LLPriestessBrown","GLOBAL",1) AddJournalEntry(@10012,QUEST)~
EXIT

CHAIN IF ~Global("O#LLPriestessBrownLetGo","GLOBAL",1)~ THEN O#LLRIEL r2
@832 /* You! Traitor! May your teeth scream in agony! If only the Matron Mother did not need your services so badly... but if you linger in Menzoberranzan, Lolth will have her revenge, doubt it not! */
DO ~EscapeArea()~
EXIT

CHAIN IF ~Global("O#LLPriestessBrown","GLOBAL",1)~ THEN O#LLRIEL r3
@833 /* Did you kill the heretics like Lolth demanded? */
END
+ ~Dead("O#LLBrow")~ + @834 /* They are dead. Where is my reward? */ EXTERN O#LLRIEL r3.1
++ @835 /* Erm... not yet. I'll be back. */ EXIT
++ @836 /* They are as good as dead, but I need to do something else first. */ EXIT

CHAIN O#LLRIEL r3.1
@837 /* Good. Their abhorrent tales about some brown-skinned abominations will not be permitted to exist! */
DO ~GiveItemCreate("MISC41",Player1,4,0,0)
AddExperienceParty(4000)
EraseJournalEntry(@10012)
AddJournalEntry(@10013,QUEST_DONE)
SetGlobal("O#LLPriestessBrown","GLOBAL",2)~
== O#LLRIEL @838 /* And take my advice: get out of Menzoberranzan while you can. Not every servant of the Spider Queen will be as merciful. */
DO ~EscapeArea()~
EXIT

CHAIN IF ~Global("O#LLPriestessBrownHeretics","GLOBAL",0)~ THEN O#LLBRO2 b2
@839 /* The umber hulks are not for sale. If you need something else, you should speak with my brother. */
EXIT

CHAIN IF ~Global("O#LLPriestessBrownHeretics","GLOBAL",0)~ THEN O#LLBROW b1
@840 /* Hello to you, <PRO_RACE>. Our umber hulks are not for purchase, I fear: we are looking after them for the Matron Mother. Do you need assistance? */
END
++ @841 /* Just passing through. */ EXIT
++ @842 /* What can you tell me about the Matron Mother? */ EXTERN O#LLBROW b1.1
++ @843 /* You are very polite for a drow. And you're looking at me almost... with pity? */ EXTERN O#LLBROW b1.2
++ @844 /* I am here to kill you! */ EXTERN O#LLBROW b1.3
++ @845 /* A priestess ordered me to murder you all. */ EXTERN O#LLBROW b1.3

CHAIN O#LLBROW b1.1
@846 /* She is a formidable woman. She is also a lenient one: the Matron Mother has little faith in rigid hierarchy, so her subjects enjoy many freedoms. Very wisely, she also employs surface mercenaries like you... and even allows other faiths in her domain. */
= @847 /* But I should not speak of this so loudly: Lolth's agents are everywhere. Please, go now. */
EXIT

CHAIN O#LLBROW b1.2
@848 /* You are a surfacer in Menzoberranzan, and as such, you are doomed. Your life here is going to be a short one, and death awaits you soon - and those you hold dear, as well. It holds true for many, be you a surface <PRO_RACE> or... a worshipper of the Dark Maiden. */
= @849 /* But that's neither here nor there. I must tend to the hulks, surfacer: now go. */
EXIT

CHAIN O#LLBROW b1.3
@850 /* You have spoken to Riel, the priestess of Lolth, haven't you? You want to kill us for worshipping Eilistraee. */
= @851 /* It is well within your rights to try. But ask yourself: do you want to help a servant of Lolth? You are a surfacer, a godchild, and I sense a strong and noble heart in you. Please, show mercy. */
END
++ @852 /* Be it as it may, you are dead. */ EXTERN O#LLBROW b1.4
++ @853 /* If you have something to say, say it.  */ EXTERN O#LLBROW b1.4
++ @854 /* Flattery will get you everywhere. All right, what do you propose? */ EXTERN O#LLBROW b1.4

CHAIN O#LLBROW b1.4
@855 /* Listen, please, and stay your hand for a moment. Many drow remain here, in the Underdark, because they have no choice. They worship Eilistraee, like I do, but they cannot live on the surface: it's too unwelcoming, too harsh, for such was the will of Corellon and our surface brethren, and also Wendonai, an ancient demonic lord who seduced our ancestors with his blood and his dark magic. */
== O#LLBROW @856 /* Yet there is a ray of hope. In her infinite kindness, the Dark Maiden is planning to revert the curse and redeem all those drow who worship her, free them of Wendonai's taint. */
== O#LLBROW @857 /* We will be physically reverted to our original state of the dark elves: brown-skinned and black-haired, and the surface will be open to us. Our lives will be our own to make. */
== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @858 /* It sounds like a noble goal, but I still have my doubts. */
== CERNDJ IF ~InParty("Cernd") InMyArea("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN @859 /* Your current state is unnatural, true. But what if not every good drow wishes to undergo this... transformation? Is it really wise to force it on everyone who worships the Dark Maiden? */
== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @860 /* Bah! Let's just kill them and go! */
== HAERDAJ IF ~InParty("Haerdalis") InMyArea("Haerdalis") !StateCheck("Haerdalis",CD_STATE_NOTVALID)~ THEN @861 /* Be wary in meddling in divine affairs, my raven. Nobody knows where this might end up. */
== IMOEN2J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @862 /* And the good drow will be able to leave the Underdark? Like Drizzt did? <CHARNAME>, we simply must help them! */
== O#LLBROW @863 /* This ritual is long in the making, and I fear that Eilistraee risks much by preparing it. But it is our only hope. Please... please... do not kill us. We will flee the city, but we must survive and support the Dark Maiden to the last breath. She needs us... and she needs your mercy. */
END
++ @864 /* Eilistraee wants to allow her worshippers to become true dark elves and to live on the surface? I happen to agree: it's a noble goal. */ EXTERN O#LLBROW b1.5
++ @865 /* I am not sure if it is a good idea, but I will not kill you. */ EXTERN O#LLBROW b1.5
++ @866 /* Too bad. You are Eilistraee followers, and you must die! */ EXTERN O#LLBROW b1.6
++ @867 /* You are traitors to your own race! And brown skin is ugly! Prepare to die like a man, you slug! */ EXTERN O#LLBROW b1.6

CHAIN O#LLBROW b1.5
@868 /* Oh... thank you! We will leave and gather other servants of Eilistraee in Ched Nasad and Ust Natha. The journey is long, but the Dark Maiden shall guide us. */
== O#LLBROW @869 /* Goodbye, kind stranger. I only regret that I have nothing to give you. */
DO ~AddExperienceParty(4000)
EraseJournalEntry(@10012)
AddJournalEntry(@10014,QUEST_DONE)
SetGlobal("O#LLPriestessBrownLetGo","GLOBAL",1)
ActionOverride("O#LLBRO2",EscapeArea()) 
ActionOverride("O#LLUMB2",EscapeArea())
ActionOverride("O#LLBRO2",EscapeArea()) 
EscapeArea()~
EXIT

CHAIN O#LLBROW b1.6
@870 /* I shall not go down without a fight! Eilistraee, give me strength! */
DO ~ActionOverride("O#LLUMB1",Enemy())
ActionOverride("O#LLUMB2",Enemy())
ActionOverride("O#LLBRO2",Enemy()) 
Enemy()~
EXIT

/* =====================================================

	Duergar: House of Shades (subquest)

===================================================== */

BEGIN O#LLKOBA
BEGIN O#LLDUER
BEGIN O#LLDUE1
BEGIN O#LLDUE2

CHAIN IF ~True()~ THEN O#LLDUER d1
@871 /* Speak to Koba. He's the chatty one. */
EXIT

CHAIN IF ~True()~ THEN O#LLDUE1 d1
@872 /* What are you staring at, oh dumbest of surfacers? */
EXIT

CHAIN IF ~True()~ THEN O#LLDUE2 d1
@873 /* You think you're so smart? Try living on the streets of Menzoberranzan for a day or two. */
EXIT

CHAIN IF ~Global("O#LLHouseShades","GLOBAL",0)~ THEN O#LLKOBA k1
@874 /* Excuse me, honored guest of the Matron Mother. May I have your attention for the tiniest of moments? */ 
END
++ @875 /* You are well-spoken for a duergar. */ EXTERN O#LLKOBA k1.0
++ @876 /* Sure, what is it? */ EXTERN O#LLKOBA k1.2
++ @877 /* Me, an honored guest? Please. I'm just a mercenary. */ EXTERN O#LLKOBA k1.1
++ @878 /* I am actually quite busy. Excuse me. */ EXIT

CHAIN O#LLKOBA k1.0
@879 /* You are too kind, oh glorious visitor to the shining black jewel of Menzoberranzan and its perfect diamond - House Jeven. */ 
END
IF ~~ EXTERN O#LLKOBA k1.2

CHAIN O#LLKOBA k1.1
@880 /* Comparable to the likes of Drizzt Do'Urden and Jarlaxle himself, I am sure! But this humble dwarf digresses. I beg you, forgive me for wasting your precious time so callously. */ 
END
IF ~~ EXTERN O#LLKOBA k1.2

CHAIN O#LLKOBA k1.2
@881 /* Please, allow me to bring the most insignificant matter to the brilliant luminance of your attention. */ 
== O#LLKOBA @882 /* The Matron Mother, in her infinite wisdom, graced our humble envoy with an embassy - a dream come true! Lush, luxurious bedrooms, slaves at our beck and call, most exquisite wines... */ 
== JANJ IF ~InParty("Jan") InMyArea("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN @883 /* And then something went wrong. */
== KELDORJ IF ~InParty("Keldorn")InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @884 /* Depravity everywhere. I have little desire to help these dwarves, but I will follow your command... for now. */
== KORGANJ IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @885 /* Har! Sounds like good livin'! */
== MAZZYJ IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @886 /* (sigh) Let me take a guess. Someone drove you out? */
== MINSCJ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @887 /* Slaves? This is outrageous! <CHARNAME>, we must free these slaves at once! */
== O#LLKOBA @888 /* And now it is all gone. By Moradin's unholy nephrite rod, the cursed slaves rebelled! There was a black sorcerer among them, with knowledge of arts so dark even Lolth herself would turn away in horror... erm, this humble dwarf means, she would gaze upon the wild destruction and chaos with great interest and benevolence. */ 
== O#LLKOBA @889 /* And that cursed sorcerer, that dog of a man, turned all our slaves into shades, including himself! Treachery, the most base of sins! I beg you, kind stranger, show mercy and goodwill towards our envoy, and liberate our house from these monsters! */ 
END
++ @890 /* All right, all right, enough, already! Where do I find these shades? */ EXTERN O#LLKOBA k1.3
++ @891 /* The House of Shades, eh? All right, I'll see what I can do. */ EXTERN O#LLKOBA k1.3
++ @892 /* I will think about it. */ EXTERN O#LLKOBA k1.3

CHAIN O#LLKOBA k1.3
@893 /* You will not miss our embassy, oh smartest of adventurers, and if you do, the most complete of maps will show you the fastest way. */ 
== O#LLKOBA @894 /* Your humblest of servants will wait here. */ 
DO ~SetGlobal("O#LLHouseShades","GLOBAL",1) AddJournalEntry(@10015,QUEST)~ 
EXIT

CHAIN IF ~Global("O#LLHouseShades","GLOBAL",1)~ THEN O#LLKOBA k2
@895 /* You return! My heart nearly bursts in joy and relief! But, please, do not keep this lowest of dwarfs waiting, oh wonder of wonders. Did you kill the shades in the embassy? */ 
END
+ ~Dead("O#LLSHAD")~ + @896 /* I just did, actually. */ EXTERN O#LLKOBA k2.1
++ @897 /* I'm working on it. */ EXTERN O#LLKOBA k2.0
++ @898 /* Not yet. */ EXTERN O#LLKOBA k2.0

CHAIN O#LLKOBA k2.0
@899 /* Nothing will stand in your way, oh mightiest of surfacers! May Moradin himself guide your steps! */
EXIT

CHAIN O#LLKOBA k2.1
@900 /* Oh, glorious day! The gods themselves will smile in heavens while looking at your sharp and blunt weapons with great respect! May every fruit of your loins be blessed and... oh, by Moradin's hammer, enough of this rot! */ 
DO ~GiveItemCreate("RING19","O#LLKOBA",1,0,0)~
== O#LLKOBA @901 /* The house is free for free, boys. Let's kill this one! */ 
DO ~AddExperienceParty(4000)
EraseJournalEntry(@10015)
AddJournalEntry(@10016,QUEST_DONE)
SetGlobal("O#LLHouseShades","GLOBAL",2)
ActionOverride("O#LLDUER",Enemy())
ActionOverride("O#LLDUE1",Enemy())
ActionOverride("O#LLDUE2",Enemy())
Enemy()~
EXIT

/* =====================================================

	Lavaes: A Sold Soul (subquest)

===================================================== */

BEGIN O#LLLAVA
BEGIN O#LLDEM

CHAIN IF ~Global("O#LLLAVAQuest","GLOBAL",0)~ THEN O#LLLAVA l1
@902 /* Hello! You're the exotic Bhaalspawn mercenary, correct? Eh, just the <PRO_MANWOMAN> I need. */
END
++ @903 /* Eh? */ EXTERN O#LLLAVA l1.1
++ @904 /* Right. And what exactly do you need? */ EXTERN O#LLLAVA l1.1

CHAIN O#LLLAVA l1.1
@905 /* Uh... if you move further into my house, you'll see a demon. Dark. Red. Big. Big demon. Heheh. */
== O#LLLAVA @906 /* And he's here for my soul! Right? Imagine that! Look... Bhaalspawn or no, you probably have more experience with demons that I do, heh. Because I only know one thing: I don't want to give MY soul to him, and I can't stall him with small talk for much longer. */
END
++ @907 /* I've seen your house. There is no demon. */ EXTERN O#LLLAVA l1.2a
++ @908 /* So, what do you want me to do? Kill the demon? */ EXTERN O#LLLAVA l1.3
++ @909 /* Do you expect me to give up MY soul, then? I don't actually have one, you know. */ EXTERN O#LLLAVA l1.3
++ @910 /* By the gods, is there a single drow in this city who DOESN'T have life-and-death problems? */ EXTERN O#LLLAVA l1.2
++ @911 /* I'll see what I can do. */ EXTERN O#LLLAVA l1.3

CHAIN O#LLLAVA l1.2a
@912 /* (sigh) Ah, yes. Of course. There is a dweomer at work that hides him from everyone who is not his summoner. Here, you can see him now. */
END
IF ~~ EXTERN O#LLLAVA l1.3

CHAIN O#LLLAVA l1.2
@913 /* I know! But that's what you're here for, right? Not for the spiders and the tentacle rods? */
END
IF ~~ EXTERN O#LLLAVA l1.3

CHAIN O#LLLAVA l1.3
@914 /* Eh, there was a rumor... a harmless piece of gossip, really, heh, that some great mage took your soul. So, if you were... say, to bargain with a demon, WHO DID NOT KNOW THAT, you could trade yourself some perks AND get him gone. Good, no? */
== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @915 /* Too good to be true, perhaps. Who knows what else you're hiding? Why should we help you at all? */
== CERNDJ IF ~InParty("Cernd") InMyArea("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN @916 /* Trading in souls is against nature. We should put an end to this, <CHARNAME>. */
== HAERDAJ IF ~InParty("Haerdalis") InMyArea("Haerdalis") !StateCheck("Haerdalis",CD_STATE_NOTVALID)~ THEN @917 /* Menzoberranzan is a City of Doors, much like Sigil. Why don't you run, little scared sparrow? Surely the demon will not follow you through every portal and arc? */
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @918 /* (sigh) Can't you banish him back to the Abyss? Or leave and ask for help? What is holding you back? */
== KELDORJ IF ~InParty("Keldorn")InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @919 /* I do not want to help this sorcerer, but we have little choice. A demon may well destroy half of the cavern, including children. They are drow, true... but small children are yet innocent. */
== O#LLLAVA @920 /* If you don't deal with the demon yourself... if you don't, then I'm dead. As his summoner, I cannot leave this house, or the magical backlash will kill me. And I cannot banish him: I haven't the strength. */
== O#LLLAVA @921 /* So... I doubt you've often heard these words from a drow mage, but... help me. Please. */
DO ~SetGlobal("O#LLLAVAQuest","GLOBAL",1)
AddJournalEntry(@10017,QUEST)~
EXIT

CHAIN IF ~Global("O#LLLAVAQuest","GLOBAL",1)~ THEN O#LLLAVA l2
@922 /* What are you doing here? Go deal with the demon! */
END
+ ~OR(2) Dead("O#LLDEM") Global("O#LLLAVAQuestDemonDealt","GLOBAL",1)~ + @923 /* Calm down. I've already dealt with your demon. */ EXTERN O#LLLAVA l2.2
++ @924 /* Actually, I don't want to. */ EXTERN O#LLLAVA l2.1
++ @925 /* All right, I'm going. */ EXIT

CHAIN O#LLLAVA l2.1
@926 /* Eh? What? You don't want... wait, wait, don't go! I have an excellent gift for you! Boots of Speed! Look! See? Not even cursed! */
= @927 /* Please, please, Bhaalspawn - you don't want that demon to escape before you bleed him dry, right? He's got a small mountain of gold just for you, I just know it! */
= @928 /* Just... don't go. Or come back later, but deal with him! Please!! */
EXIT

CHAIN O#LLLAVA l2.2
@929 /* It cannot be! It's gone? It's really gone? How... how did you?.. No, wait, I don't want to know. */
= @930 /* I am free! I can actually leave this house... oh, wait, it's my house. In any case, I need to take a walk. But I won't let you leave without your reward, beautiful stranger. Wear these boots proudly. And I'll probably need to check my coffers, lockers and chests later. These cursed demons are all lowly thieves, I know it! */
DO ~AddExperienceParty(4000)
EraseJournalEntry(@10017)
AddJournalEntry(@10018,QUEST_DONE)
GiveItemCreate("BOOT01",Player1,1,0,0)
MoveToPoint([480.1170])
DestroySelf()~
EXIT

CHAIN IF ~Global("O#LLLAVAQuestDemonFirst","GLOBAL",0)~ THEN O#LLDEM d1
@931 /* Ah, a familiar face. Well, not quite, but I know of you. Your own dear brother told me a few things about his murderer. <CHARNAME>, is it? Charmed. */ 
END
++ @932 /* My brother? Do you mean Sarevok? */ EXTERN O#LLDEM d1.1
++ @933 /* You've met Sarevok in Hell? */ EXTERN O#LLDEM d1.1

CHAIN O#LLDEM d1.1
@934 /* He proved to be the most boring conversationalist: all bitterness and ashes. But he was a fine, fine warrior. You lost a valuable ally. A potential ally, granted, but nevertheless. */
= @935 /* But enough about family reunions - you'll get enough of those soon enough, if you keep bothering me. What do you want, Bhaalspawn? */
END
++ @936 /* I want you to leave the mage, Lavaes, alone. */ EXTERN O#LLDEM d1.2
++ @937 /* You came for the mage's soul. He doesn't want to give it to you. */ EXTERN O#LLDEM d1.2
++ @938 /* Can I persuade you to leave? */ EXTERN O#LLDEM d1.2

CHAIN O#LLDEM d1.2
@939 /* Ah. There is something you don't know, <CHARNAME>. */
= @940 /* You see, it was Lavaes who summoned me here with exactly this purpose - he wanted to barter his soul for untold power and riches. He got cold feet at the last moment, but before that? It was his free choice. */
END
++ @941 /* Well, now it isn't. Let him go. */ EXTERN O#LLDEM d1.3
++ @942 /* What if I offer you something in return? Something greater? My own soul, for example? */ EXTERN O#LLDEM d1.3
++ @943 /* Why would you want his shivering soul, anyway? Take mine instead. I don't mind untold power and riches. */ EXTERN O#LLDEM d1.3

CHAIN O#LLDEM d1.3
@944 /* I suppose I could let Lavaes go... and even reward you quite richly... if I am persuaded with a taste of divinity. If your soul becomes mine, I will let Lavaes go free. */
DO ~SetGlobal("O#LLLAVAQuestDemonFirst","GLOBAL",1)~
== O#LLDEM @945 /* But consider this carefully, <CHARNAME>: I will leave only with your soul. Otherwise you may as well leave and let the mage stall me for another hour... or day. My patience is boundless, and his powers are limited. */
END
++ @946 /* Let me think about it, first. */ EXTERN O#LLDEM d1.4
++ @947 /* I don't like the idea of selling my soul, to be honest. */ EXTERN O#LLDEM d1.4
++ @948 /* I am sure. Take my soul. */ EXTERN O#LLDEM d1.5

CHAIN O#LLDEM d1.4
@949 /* Very well. Come back whenever you wish: as you see, I am not going anywhere. */
EXIT

CHAIN IF ~Global("O#LLLAVAQuestDemonFirst","GLOBAL",1)~ THEN O#LLDEM d2
@950 /* Ah, you are back, my slippery Bhaalspawn. Well? */ 
END
++ @951 /* I have decided. Take my soul and reward me. */ EXTERN O#LLDEM d1.5
++ @952 /* Nothing. I am still thinking. */ EXTERN O#LLDEM d1.4

CHAIN O#LLDEM d1.5
@953 /* Good! But I am not just *taking* your soul, you see. I am *paying* you for it - which means that you must *convince* me to buy it. */
END
+ ~CheckStatGT(Player1,15,STR)~ + @954 /* Just look at me flexing these muscles, demon-boy! Can you pass this super strength? My soul will kick your ass! */ EXTERN O#LLDEM d1.str
+ ~CheckStatGT(Player1,15,DEX)~ + @955 /* I am quicker than a monkey and nimbler than a queen's needle. You won't find a soul any finer. */ EXTERN O#LLDEM d1.dex
+ ~CheckStatGT(Player1,15,CON)~ + @956 /* No disease can take me out, no wound can truly hurt me. I am invincible. Invincible, I say! */ EXTERN O#LLDEM d1.con
+ ~CheckStatGT(Player1,15,INT)~ + @957 /* My mind is a sharp instrument, and my soul would never be complete without it. Any mage would shrivel in black envy, including Lavaes. */ EXTERN O#LLDEM d1.int
+ ~CheckStatGT(Player1,15,WIS)~ + @958 /* I see through liars, bargain with con artists and know more of the world than anyone but the wisest sages of Candlekeep. */ EXTERN O#LLDEM d1.wis
+ ~CheckStatGT(Player1,15,CHR)~ + @959 /* Can't this charming, charming smile convince you? Really? */ EXTERN O#LLDEM d1.chr
++ @960 /* I really have nothing to tell you. Hmm, maybe my physical and mental talents aren't impressive enough? My biceps aren't bulging and my mind is too blunt? I'll think about it. */ EXTERN O#LLDEM d1.4
++ @961 /* All right, all right. I'll do some convincing later, but now I must go. */ EXTERN O#LLDEM d1.4

CHAIN O#LLDEM d1.str
@962 /* Ho-ho! Your soul may well function as my personal bodyguard, my dear <PRO_RACE>. */
END
IF ~~ EXTERN O#LLDEM d1.sold

CHAIN O#LLDEM d1.dex
@963 /* A quick, nimble, nearly invisible soul, huh? A perfect assassin. */
END
IF ~~ EXTERN O#LLDEM d1.sold

CHAIN O#LLDEM d1.con
@964 /* That's what *you* think. But such health is quite remarkable, yes. I bet your soul even regenerates if you cut off its fingers, hmm? */
END
IF ~~ EXTERN O#LLDEM d1.sold

CHAIN O#LLDEM d1.int
@965 /* Interesting. I've been needing a new assistant torturer - the old one had such primitive fantasies! Imagine boiling innocent maidens in hot water, but leaving them their tunics to preserve their *modesty* and *dignity*! Idiot. */
END
IF ~~ EXTERN O#LLDEM d1.sold

CHAIN O#LLDEM d1.wis
@966 /* Wisdom? A truly wise man would never trade with me in the first place. But 'tis true, wise souls are rare... and yours is nearly divine. */
END
IF ~~ EXTERN O#LLDEM d1.sold

CHAIN O#LLDEM d1.chr
@967 /* Haha! You are a cheeky one, little <PRO_RACE>. And, indeed, a charming one. I like you. */
END
IF ~~ EXTERN O#LLDEM d1.sold

CHAIN O#LLDEM d1.sold
@968 /* Well... you've convinced me. Sold! */
== O#LLDEM @969 /* Now, then, your soul is mine, so it is time for me to go. Here is the down payment on your soul. */
DO ~SetGlobal("O#LLLAVAQuestDemonDealt","GLOBAL",1)
AddExperienceParty(2000)
GiveGoldForce(2000)~
== O#LLDEM @970 /* You will receive the remainder over the next ten years, heheh. And, of course, you have my word that I shall now leave and never return. You and Lavaes are free, and... wait. */
== O#LLDEM @971 /* NO! You charlatan! You dirty, filthy, cheating piece of slime! Someone has already laid claim to your soul, and our bargain is null and void... except that I have already given you my word, and in this instance, it is binding. */
== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @972 /* Good for us! Now, you were about to leave, were you? (Or maybe I should add his heart to my collection. Yes, I should.) */
== IMOEN2J IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @973 /* Heheh! Gotcha! */
== JANJ IF ~InParty("Jan") InMyArea("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ THEN @974 /* Now, this is a story my poor relatives will be hearing from me again and again. */
== MAZZYJ IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @975 /* You lied... but it was a good lie, my friend. You still have my respect. */
== NALIAJ IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @976 /* Watch your tongue, demon. We *will* defeat you if you try anything. */
== O#LLDEM @977 /* I shall find you in the Nine Hells after you die, <PRO_RACE>. You have my word on *that*. One day... */
DO ~ClearAllActions()
StartCutSceneMode()
CreateVisualEffectObject("SPSUMGTE",Myself)
CreateVisualEffectObject("SPFIREPI",Myself)
Wait(3)
DestroySelf()
EndCutSceneMode()~
EXIT

/* =====================================================

 Black Arena (subquest): drow fighters, mummies, golems

===================================================== */

BEGIN O#LLDARR

CHAIN IF ~Global("O#LLBlackArena","GLOBAL",0)~ THEN O#LLDARR d1
@978 /* Greetings, Bhaalspawn. This is the place where the best fighters of House Jeven test their cunning and stamina. */
== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @979 /* Oh! <CHARNAME>, p-please, let us leave! We shouldn't be here, we really shouldn't! */
== KORGANJ IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @980 /* My kind of place! Bring it on! */
== MINSCJ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @981 /* Minsc will test his cunning! And stamina! Boo will take care of the details. */
== VALYGARJ IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN @982 /* Not a bad arena. Do you want to fight, <CHARNAME>? */
== VICONIJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @983 /* Fools. Only one out of four survives. Of course, those idiots had no divine blood in their veins, no healing spells and little magic... */
== O#LLDARR @984 /* As of tonight, no one has ever completed the full triad of trials and lived. Are you interested in trying, Bhaalspawn? */
END
++ @985 /* I am. What are the rules? */ EXTERN O#LLDARR d1.2
++ @986 /* Maybe later. */ EXTERN O#LLDARR d1.1

CHAIN O#LLDARR d1.1
@987 /* Come back any time. Our warriors will benefit from a lesson... or the sight of your mutilated body. */
EXIT

CHAIN O#LLDARR d1.2
@988 /* Fight, kill and survive the challenge. There are three rounds, and the first one starts now. */
= @989 /* Are you ready? */
END
++ @990 /* Ready. Start the challenge. */ EXTERN O#LLDARR d1.3
++ @898 /* Not yet. */ EXTERN O#LLDARR d1.1

CHAIN O#LLDARR d1.3
@991 /* At once. Prepare yourself. */
DO ~AddJournalEntry(@10019,QUEST)
SetGlobal("O#LLBlackArena","GLOBAL",1)
ApplySpell(Myself,DRYAD_TELEPORT)~
EXIT

CHAIN IF ~Global("O#LLBlackArena","GLOBAL",2)~ THEN O#LLDARR d2
@992 /* The first challenge is complete. Prepare for the second one! */
DO ~SetGlobal("O#LLBlackArena","GLOBAL",3)
AddExperienceParty(6000)
ApplySpell(Myself,DRYAD_TELEPORT)~
EXIT

CHAIN IF ~Global("O#LLBlackArena","GLOBAL",4)~ THEN O#LLDARR d3
@993 /* And you survive the second challenge! No rest for the wicked: the final one awaits. */
DO ~SetGlobal("O#LLBlackArena","GLOBAL",5)
AddExperienceParty(6000)
ApplySpell(Myself,DRYAD_TELEPORT)~
EXIT

CHAIN IF ~Global("O#LLBlackArena","GLOBAL",6)~ THEN O#LLDARR d4
@994 /* Unbelievable. Some weak <PRO_RACE> had done what our finest warriors could not. Seeing how you are still alive, I hereby declare you the victor - and here is your ill-deserved reward. Surface gold for a surfacer. Don't mind the blood. */
== O#LLDARR @995 /* Walk carefully, <PRO_RACE>. I expect none would try to challenge you openly after this victory, but daggers in the back are only too common in Menzoberranzan. Do not chance the walkways alone. */
DO ~GiveGoldForce(6000)
AddExperienceParty(6000)
EraseJournalEntry(@10019)
AddJournalEntry(@10020,QUEST_DONE)
GiveItemCreate("o#llbr1",Player1,1,0,0)
SetGlobal("O#LLBlackArena","GLOBAL",7)
ApplySpell(Myself,DRYAD_TELEPORT)~
EXIT

/* =====================================================

		Filler (commoners, kobolds)

===================================================== */

BEGIN O#LLKOB1
BEGIN O#LLKOB2
BEGIN O#LLKOB3
BEGIN O#LLMAN1
BEGIN O#LLMAN2
BEGIN O#LLMAN3
BEGIN O#LLMAN4
BEGIN O#LLMAN5
BEGIN O#LLMAN6
BEGIN O#LLWOM1
BEGIN O#LLWOM2
BEGIN O#LLWOM3
BEGIN O#LLWOM4
BEGIN O#LLWOM5
BEGIN O#LLWOM6

// Streets, kobolds

CHAIN IF ~RandomNum(3,1)~ THEN O#LLKOB1 k1
@996 /* Work, work, work! Out of my way, before they put some goblin here instead! */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#LLKOB1 k2
@997 /* Good master, kind master... grrrr! */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#LLKOB1 k3
@998 /* Hatessss them, hatesss them, hatesss them! Bad drow, bad! Shhh! Said nothing! */
EXIT

CHAIN IF ~RandomNum(3,1)~ THEN O#LLKOB2 k1
@999 /* Youse came with Kimmuriel Oblodra, yes? Oblodra house had thousands and thousands of kobolds... only a hundred survived. The whole house - boom! Down! Clawrift... waaah! Scary. */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#LLKOB2 k2
@1000 /* Nobody loves us kobolds... (sniff) */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#LLKOB2 k3
@1001 /* Surfacer, hmm? Youse won't last in Menzoberr... berranzan! */
EXIT

CHAIN IF ~RandomNum(3,1)~ THEN O#LLKOB3 k1
@1002 /* Saw the great Jarlaxle of Bregan D'aerthe some time ago entering the Matron's palace. Never saw him exiting. Something happened, maybe? */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#LLKOB3 k2
@1003 /* Working, working! Bad back, bad back. (sigh) Will die soon. */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#LLKOB3 k3
@1004 /* Youse has some bread, maybe? Surface bread? Tried some crumbs once, tasted good! Too bad - only mushrooms here. */
EXIT

// Streets, drow males

CHAIN IF ~RandomNum(3,1)~ THEN O#LLMAN1 m1
@1005 /* I've heard a rival house is going to overwhelm us soon. */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#LLMAN1 m2
@1006 /* We are doomed! Doomed! House Jeven is weakening, and Menzoberranzan has no place for the weak! */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#LLMAN1 m3
@1007 /* The Matron Mother is too tolerant of surfacers. */
EXIT

CHAIN IF ~RandomNum(3,1)~ THEN O#LLMAN2 m1
@1008 /* What are you looking at, <PRO_RACE>? */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#LLMAN2 m2
@1009 /* Talking to me like an equal! Kimmuriel should whip you raw for such insolence! */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#LLMAN2 m3
@1010 /* Surfacers are filth. All of them. */
EXIT

CHAIN IF ~RandomNum(3,1)~ THEN O#LLMAN3 m1
@1011 /* The Matron's own son is against her. She should kill him at once! */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#LLMAN3 m2
@1012 /* Lorn Jeven is good Bregan D'aerthe material. Why don't you recruit him? */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#LLMAN3 m3
@1013 /* I don't think you and I have anything to discuss, surfacer. Bregan D'aerthe are all opportunists, surfacers or no. */
EXIT

CHAIN IF ~RandomNum(3,1)~ THEN O#LLMAN4 m1
@1014 /* Can Kimmuriel really stop any mage from casting spells? That's impossible, isn't it? */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#LLMAN4 m2
@1015 /* Who do you think would win in a fight, Kimmuriel or Archmage Gromph? */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#LLMAN4 m3
@1016 /* Jarlaxle was good for Bregan D'aerthe, but I must admit, this Oblodra fellow is pretty impressive, too. */
EXIT

CHAIN IF ~RandomNum(3,1)~ THEN O#LLMAN5 m1
@1017 /* First losses at the Black Arena, now cheating at the competition... Our fighters become weaker and weaker. */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#LLMAN5 m2
@1018 /* Pure drow must never fraternize with surfacers! If you enter the lust chambers, <PRO_RACE>, know that no one will even touch you. */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#LLMAN5 m3
@1019 /* I've heard there are actual followers of Eilistraee in House Jeven! The priestesses must surely do something about that! */
EXIT

CHAIN IF ~RandomNum(3,1)~ THEN O#LLMAN6 m1
@1020 /* Something tells me I shall see your lifeless body very soon, surfacer. */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#LLMAN6 m2
@1021 /* Running errands for Kimmuriel? I suppose there are worse fates for a surface slave. */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#LLMAN6 m3
@1022 /* How come you're not wearing a slave collar, <PRO_RACE>? */
EXIT

// Streets, drow females

CHAIN IF ~RandomNum(3,1)~ THEN O#LLWOM1 w1
@1023 /* This Kimmuriel is very handsome, isn't he? */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#LLWOM1 w2
@1024 /* I wonder if Kimmuriel Oblodra ever visits the lust chambers... */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#LLWOM1 w3
@1025 /* I should really go and take a look at that handsome young drow from Bregan D'aerthe. They say he can make Handmaidens swoon with a single touch! */
EXIT

CHAIN IF ~RandomNum(3,1)~ THEN O#LLWOM2 w1
@1026 /* Don't approach me, surfacer. */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#LLWOM2 w2
@1027 /* A surface mercenary? Here? I thought Bregan D'aerthe could sink no lower. */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#LLWOM2 w3
@1028 /* Ugh. You are breathing right at me! Stop it! */
EXIT

CHAIN IF ~RandomNum(3,1)~ THEN O#LLWOM3 w1
@1029 /* Tell me, <PRO_RACE>, have you ever slept with drow females? You look... sturdy enough for this kind of adventure. */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#LLWOM3 w2
@1030 /* I like surfacers. Men, women, dwarves... do surface dwarves even have men or women? It's hard to tell. */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#LLWOM3 w3
@1031 /* I'm feeling adventurous. Maybe you and I should take a walk to the lust chambers some time, hmm? */
EXIT

CHAIN IF ~RandomNum(3,1)~ THEN O#LLWOM4 w1
@1032 /* I've once slept with a Bregan D'aerthe mercenary. He was incredible in bed! */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#LLWOM4 w2
@1033 /* I saw Jarlaxle the other night. No, quite a while ago, actually. Do you know where he is? */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#LLWOM4 w3
@1034 /* We need more men like Bregan D'aerthe fighters. Brash, bold, uncompromising - and yet knowing their place. I enjoy seeing them on their knees... in my bedchambers. */
EXIT

CHAIN IF ~RandomNum(3,1)~ THEN O#LLWOM5 w1
@1035 /* I visited the surface once, during my Blooding. Killed seven surface males, and none even came close to my former mate. A pity. I prefer strong opponents. */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#LLWOM5 w2
@1036 /* You look capable, <PRO_RACE>. We should spar sometime... although I am not sure you deserve the honor. */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#LLWOM5 w3
@1037 /* Are there more surface <PRO_MALEFEMALE>s like you? I am intrigued. */
EXIT

CHAIN IF ~RandomNum(3,1)~ THEN O#LLWOM6 w1
@1038 /* Can you tell me of Kimmuriel? He is so alluring, but unapproachable. It's frustrating! */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#LLWOM6 w2
@1039 /* I once ordered a male whipped raw. He escaped House Jeven and joined Bregan D'aerthe. Haven't seen him since. Hmm, do you think I miss him? No. Not a mere male. Can't be. */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#LLWOM6 w3
@1040 /* I saw my former lover taking orders from Kimmuriel today. He is still alive, then. I wonder... */
EXIT

/* =====================================================

			Tavern

===================================================== */

BEGIN O#LLTAM1
BEGIN O#LLTAM2
BEGIN O#LLTAW1
BEGIN O#LLTAW2
BEGIN O#LLTAV
BEGIN O#LLTAVR

// Tavern males

CHAIN IF ~RandomNum(3,1)~ THEN O#LLTAM1 m1
@1041 /* Elverquisst from Ust Natha! I hear they sacked Suldanessellar. Good for them! */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#LLTAM1 m2
@1042 /* Hey! Surfacer! Is it true that good ale costs less than kobold shit on the surface? If so, I'm leaving for the surface right now! Yeah! */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#LLTAM1 m3
@1043 /* Let's raise the glasses and drink the Matron's health! May House Jeven stand tall in Menzoberranzan for another thousand years! Or at least ten. */
EXIT

CHAIN IF ~RandomNum(3,1)~ THEN O#LLTAM2 m1
@1044 /* Kimmuriel sent you here to drink, eh? Good drow! */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#LLTAM2 m2
@1045 /* Can't say I miss the outside. It's warm and dry here, and we have winter wine! These surface merchants are truly stupid, selling this for only five hundred gold a bottle! It costs at least a thousand! */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#LLTAM2 m3
@1046 /* I keep drinking to forget... what? */
EXIT

// Tavern females

CHAIN IF ~RandomNum(3,1)~ THEN O#LLTAW1 w1
@1047 /* I've heard that surface women aren't welcome in taverns and inns, if they don't have a strong male to protect them. Fools. A tentacle rod calms even the wildest beasts. */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#LLTAW1 w2
@1048 /* You are cloaked in shadow... I like your look. Mysterious. */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#LLTAW1 w3
@1049 /* Have you ever seen the stars? I'm told they are very pretty on the surface. They shine like rubies or star sapphires... but are worth nothing. Isn't it strange? */
EXIT

CHAIN IF ~RandomNum(3,1)~ THEN O#LLTAW2 w1
@1050 /* All these stupid women mooning after Kimmuriel Oblodra, when he is only a mere male, and his house is dust! Can't they see? */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#LLTAW2 w2
@1051 /* I'm quite partial to handsome males, but only if they're passionate. Your Kimmuriel is like a fish! He never even answered my smiles! */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#LLTAW2 w3
@1052 /* If you see Kimmuriel, tell that cold son of a drider that... No. Don't tell him anything. Leave. */
EXIT

// Tavern: rest

CHAIN IF ~True()~ THEN O#LLTAV t1
@1053 /* What do you need, surfacer? A room, a drink, another drink? Lust chambers are that way, if you're lost. */
END
++ @1054 /* Thanks. I'll go now. */ EXIT
++ @1055 /* Show me your services. */ DO ~StartStore("O#LLTAV",LastTalkedToBy())~ EXIT

CHAIN IF ~RandomNum(6,1)~ THEN O#LLTAVR tr1
@1056 /* Trusting Bregan D'aerthe is a mistake. The Matron Mother should've never allowed them in. */
EXIT

CHAIN IF ~RandomNum(6,2)~ THEN O#LLTAVR tr2
@1057 /* The whole Oblodra house should've been obliterated. No good comes out of dealing with psionicists. */
EXIT

CHAIN IF ~RandomNum(6,3)~ THEN O#LLTAVR tr3
@1058 /* The tournament between the best fighters was rigged. A mage was involved, mark my words. */
EXIT

CHAIN IF ~RandomNum(6,4)~ THEN O#LLTAVR tr4
@1059 /* Githyanki are bad allies. Too self-absorbed. The Matron Mother shouldn't trust them. */
EXIT

CHAIN IF ~RandomNum(6,5)~ THEN O#LLTAVR tr5
@1060 /* Menzoberranzan is no place for surfacers. They die too fast. */
EXIT

CHAIN IF ~RandomNum(6,6)~ THEN O#LLTAVR tr6
@1061 /* Ust Natha should've destroyed that silver dragon ages ago. Fools. */
EXIT

/* =====================================================

		Lust chambers

===================================================== */

BEGIN O#LLLUM1
BEGIN O#LLLUM2
BEGIN O#LLLUW1
BEGIN O#LLLUW2

BEGIN O#LLSEXW
BEGIN O#LLSEXM

// Lust chambers, males

CHAIN IF ~RandomNum(3,1)~ THEN O#LLLUM1 m1
@1062 /* Here for some fun, huh? */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#LLLUM1 m2
@1063 /* You should leave, <PRO_RACE>. There are not enough partners for everyone as it is. */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#LLLUM1 m3
@1064 /* A surfacer! And you think a drow'll have you? */
EXIT

CHAIN IF ~RandomNum(3,1)~ THEN O#LLLUM2 m1
@1065 /* Choose your destiny, surfacer. Are you ready to die tonight, bloodied, whipped and beaten in a bedchamber? Or do you prefer to be fed to driders for your insolence? */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#LLLUM2 m2
@1066 /* You are brave to come here. But if you are truly wise, you will leave. Now. */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#LLLUM2 m3
@1067 /* Foolish <PRO_MALEFEMALE>. Our lust chambers are not for you. */
EXIT

// Lust chambers, females

CHAIN IF ~RandomNum(3,1)~ THEN O#LLLUW1 w1
@1068 /* Fresh blood! Interesting. Has Kimmuriel come with you, I wonder? Never seen him here before. */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#LLLUW1 w2
@1069 /* Jarlaxle visited this place once. Or twice? I think he found the Matron's palace more to his liking, if you get my drift. */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#LLLUW1 w3
@1070 /* Surfacer, stop glaring at me like that! I'm drunk, and I feel naked. Or maybe I should get naked? Now, there's an idea! */
EXIT

CHAIN IF ~RandomNum(3,1)~ THEN O#LLLUW2 w1
@1071 /* Can you sing, surfacer? Sing, then, and sing loudly, for this is your last day in Menzoberranzan! Any drow you'll bed here will have you killed in the morning just to hide their shame, haha! */
EXIT

CHAIN IF ~RandomNum(3,2)~ THEN O#LLLUW2 w2
@1072 /* Don't stand so close to me unless you want to feel Lolth's wrath, surfacer! */
EXIT

CHAIN IF ~RandomNum(3,3)~ THEN O#LLLUW2 w3
@1073 /* Step back! Meet my gaze again, and I'll pluck out your eyes! */
EXIT

// Rest, sex, massage in lust chambers

// Male

CHAIN IF ~!InPartySlot(LastTalkedToBy,0)~ THEN O#LLSEXM m0
@1074 /* I would like to speak with your leader. */
EXIT

CHAIN IF ~InPartySlot(LastTalkedToBy,0)~ THEN O#LLSEXM m1
@1075 /* I expected you. Even before you arrived, rumors flooded the city about a great conqueror from the surface: a fabled Child of Bhaal. */
END
IF ~~ EXTERN O#LLSEXM m1.2
IF ~Gender(Player1,FEMALE)~ EXTERN O#LLSEXM m1.1

CHAIN O#LLSEXM m1.1
@1076 /* And that you are so beautiful is even more appealing. */
END
IF ~~ EXTERN O#LLSEXM m1.2

CHAIN O#LLSEXM m1.2
@1077 /* Here, in the lust chambers, we relax our bodies on the finest silks and enjoy exquisite drinks and cool hands on our skin... or oil, hot tongues and hard leather for the more adventurous. */
= @1078 /* Some come to forget, some come to spend the night and relax while the pain fades away. Whatever you want, you may find it here. */
= @1079 /* You are much too young, and the dangers of Menzoberranzan must have already taken their toll. My skills at massage and other healing and relaxing arts are renown, and the Matron ordered me to provide you with the very best... including the dark and the forbidden. */
END
+ ~Gender(Player1,MALE)~ + @1080 /* Very well, I will have a massage. */ EXTERN O#LLSEXM m1.3
+ ~Gender(Player1,MALE)~ + @1081 /* The dark and the forbidden? I am intrigued.  */ EXTERN O#LLSEXM m1.3
+ ~Gender(Player1,FEMALE)~ + @1080 /* Very well, I will have a massage. */ EXTERN O#LLSEXM m1.4
+ ~Gender(Player1,FEMALE)~ + @1081 /* The dark and the forbidden? I am intrigued.  */ EXTERN O#LLSEXM m1.4
++ @1082 /* My answer is no. */ EXIT

CHAIN O#LLSEXM m1.3
@1083 /* Come, sit on the bed... throw back your head and relax your shoulders. Tonight, you are the lord and master of your own desires, and the Dark Mother herself will have no argument. */
DO ~SetGlobal("O#LLSellswordsMassageMale","GLOBAL",1)
ApplySpell(LastTalkedToBy,CLERIC_HEAL)
RestParty()~
EXIT

CHAIN O#LLSEXM m1.4
@1084 /* Come, sit on the bed... throw back your head and relax your shoulders. Tonight, you are the queen of your own desires, and the Dark Mother herself will have no argument. */
DO ~SetGlobal("O#LLSellswordsMassageMale","GLOBAL",1)
ApplySpell(LastTalkedToBy,CLERIC_HEAL)
RestParty()~
EXIT

// Female

CHAIN IF ~!InPartySlot(LastTalkedToBy,0)~ THEN O#LLSEXW w0
@1085 /* You have no true divine blood in your veins, <MALEFEMALE>, only fear and spit. Do not anger me by approaching again. */
EXIT

CHAIN IF ~InPartySlot(LastTalkedToBy,0)~ THEN O#LLSEXW w1
@1086 /* You are a strange <PRO_MANWOMAN>: a surface <PRO_RACE>, yet the Matron Mother ordered everyone to assist you under pain of death. */
= @1087 /* But you need not fear, lovely <PRO_MALEFEMALE>: I like unraveling mysteries, and you are quite an enigma. */
= @1088 /* Do you want to stay the night? I will fuel the flames of your heart and relax your body, guide you into the deepest pits of depravity and soothe your aches. A night with me will be worth your attention. */
END
++ @1089 /* Very well. Lead on. */ EXTERN O#LLSEXW w1.1
++ @1090 /* Not interested. */ EXIT

CHAIN O#LLSEXW w1.1
@1091 /* There are couches and cushions in the room upstairs, and enough elder wine to keep a duergar horde snoring. Your companions will be well-tended for. */
END
IF ~~ EXTERN O#LLSEXW w1.2
IF ~Gender(Player1,FEMALE)~ EXTERN O#LLSEXW w1.3

CHAIN O#LLSEXW w1.2
@1092 /* But you... you deserve something special. Come, my exotic tiger: it is time you've tasted what Menzoberranzan can give you. */
DO ~SetGlobal("O#LLSellswordsMassageFemale","GLOBAL",1)
ApplySpell(LastTalkedToBy,CLERIC_HEAL)
RestParty()~
EXIT

CHAIN O#LLSEXW w1.3
@1093 /* But you... you deserve something special. Come, my exotic tigress: it is time you've tasted what Menzoberranzan can give you. */
DO ~SetGlobal("O#LLSellswordsMassageFemale","GLOBAL",1)
ApplySpell(LastTalkedToBy,CLERIC_HEAL)
RestParty()~
EXIT

/* =====================================================

			Shopkeepers

===================================================== */

BEGIN O#LLMERA
BEGIN O#LLMERP
BEGIN O#LLMERS
BEGIN O#LLMERW

// Arrows

CHAIN IF ~True()~ THEN O#LLMERA a1
@1094 /* Welcome to my stall, honored guest of the Matron Mother. You would do well to watch your back... and my darts and arrows can help you in this like no other. */
END
++ @1095 /* Let me see what you offer. */ DO ~StartStore("O#LLARR",LastTalkedToBy())~ EXIT
++ @1096 /* Another time, perhaps. */ EXIT

// Potions

CHAIN IF ~True()~ THEN O#LLMERP p1
@1097 /* Bhaalspawn! They say you are the quickest duelist on the surface. But even the fastest fighter needs some extra edge, no? Do you need some potions to improve your worth? */
END
++ @1098 /* Indeed I do. Show me your potions. */ DO ~StartStore("O#LLPOT",LastTalkedToBy())~ EXIT
++ @1099 /* Not at the moment. */ EXIT

// Scrolls

CHAIN IF ~True()~ THEN O#LLMERS s1
@1100 /* The Matron Mother asked me to assist you however I can, but you must pay a full price on each of my magic scrolls. As Lolth demands. */
END
++ @1101 /* You have scrolls and such, then? I'll take a look. */ DO ~StartStore("O#LLSCR",LastTalkedToBy())~ EXIT
++ @1102 /* I'll be going now. */ EXIT

// Normal weapons and armor

CHAIN IF ~True()~ THEN O#LLMERW w1
@1103 /* Do you need some mundane weapons, <PRO_MALEFEMALE>? Acquired in the last surface raid, and yours, if you have enough money to pay. */
END
++ @1104 /* Simple weapons? Show me. */ DO ~StartStore("O#LLWEP",LastTalkedToBy())~ EXIT
++ @1105 /* No, I don't need these. */ EXIT

/* =====================================================

			MINI-QUESTS

===================================================== */

BEGIN O#LLZEDE
BEGIN O#LLBOR
BEGIN O#LLMERE

// A Stolen Spellbook

CHAIN IF ~!PartyHasItem("O#LLSpel")~ THEN O#LLZEDE z1
@1106 /* What is my plight to you, surfacer? I have been cast out from Sorcere. Unless I recover my spellbook, my whole life is lost. And I have no idea where the blasted thing is! */
EXIT

CHAIN IF ~PartyHasItem("O#LLSpel")~ THEN O#LLZEDE z2
@1107 /* You... you have my spellbook! I can feel the emanations. My life has been saved! Please, surfacer, take this as a token of my appreciation. */
DO ~TakePartyItem("O#LLSpel")
AddExperienceParty(2000)
GiveItemCreate("SCRL8G",Player1,1,0,0)
ApplySpell(Myself,DRYAD_TELEPORT)~
EXIT

// A Blind Warrior

CHAIN IF ~!PartyHasItem("O#LLCure")~ THEN O#LLBOR b1
@1108 /* A rogue mage from Ched Nasad took my sight and my pride. Stewards of the Black Arena used to have a cure for my affliction. If they have it still, bring it to me, and I will reward you richly. */
EXIT

CHAIN IF ~PartyHasItem("O#LLCure")~ THEN O#LLBOR z2
@1109 /* The cure for my blindness! It smells of deep mushrooms and deathroot, just like the priestesses said. Give it to me, let me... you... I can see your face! You are a surfacer, yet you would show kindness to a drow warrior? Amazing. */
== O#LLBOR @1110 /* Let no one call me ungrateful. Here is your reward, <PRO_RACE>. You deserve every coin. */
DO ~TakePartyItem("O#LLCure")
AddExperienceParty(2000)
GiveGoldForce(2000)
MoveToPoint([385.250])
DestroySelf()~
EXIT

// Jarlaxle's Baby

CHAIN IF ~True()~ THEN O#LLMERE m1
@1111 /* Please, go away, Child of Bhaal. This is none of your affair. */
END
++ @1112 /* You just told a priestess you were expecting Jarlaxle's child. Is this true? */ EXTERN O#LLMERE m1.1
++ @1113 /* I just want to help. */ EXTERN O#LLMERE m1.1
++ @1114 /* I agree. Never mind. */ EXIT

CHAIN O#LLMERE m1.1
@1115 /* I... I lied. I went to the tavern and talked to Kimmuriel, but he saw through my lies at once. */
= @1116 /* Jarlaxle is not the father of my child. */
END
++ @1117 /* Then who is? */ EXTERN O#LLMERE m1.2
++ @1118 /* Are they really going to sacrifice the baby once it is born? */ EXTERN O#LLMERE m1.2

CHAIN O#LLMERE m1.2
@1119 /* It is our custom to sacrifice the third sons to Lolth. Jarlaxle hates this custom with a passion... but he is not here to help me now. You are. All right, I will tell you everything. */
== O#LLMERE @1120 /* I am the youngest dauther of the Matron Mother. She married me off to her advisor and consort, Jey'Re, as a reward after I failed my Blooding. I couldn't kill, I've never killed in my life! I do not know why my mother let me live. */
== O#LLMERE @1121 /* But life with Jey'Re was little better. He is a cold man, a cruel man. He never even came to look at the twins, and he does not care about the baby. When I asked him to save our child, his child, he abandoned me. */
== O#LLMERE @1122 /* Jarlaxle promised to help me. But he disappeared, and I have nowhere to go. A caravan will depart for the surface next month, but the guards are asking a thousand gold for the passage. I do not have it. */
END
+ ~PartyGoldGT(999)~ + @1123 /* Here, take the money and go to the surface. */ EXTERN O#LLMERE m1.3
++ @1124 /* Sorry, but I cannot help you. */ EXTERN O#LLMERE m1.4
++ @1125 /* I wish I could help, but I don't have enough money. */ EXTERN O#LLMERE m1.4

CHAIN O#LLMERE m1.3
@1126 /* Oh. I... Really? Thank you! */
== O#LLMERE @1127 /* You are the bravest, most wonderful <PRO_MANWOMAN> I've ever met. One day I will tell my child about you. For the rest of my life you will have my prayers. */
DO ~TakePartyGold(1000)
AddExperienceParty(2000)
MoveToPoint([552.1174])
DestroySelf()~
EXIT

CHAIN O#LLMERE m1.4
@1128 /* I understand. You are a prisoner here, too. */
= @1129 /* Fare you well, Child of Bhaal. I do not think we will meet again. */
DO ~MoveToPoint([552.1174])
DestroySelf()~
EXIT

// A Slave Girl

BEGIN O#LLGIRL
BEGIN O#LLBAN
BEGIN O#LLBAN2
BEGIN O#LLBAN3

CHAIN IF ~True()~ THEN O#LLGIRL g1
@1134
EXIT

CHAIN IF ~True()~ THEN O#LLBAN b1
@1135
EXIT

CHAIN IF ~True()~ THEN O#LLBAN2 b2
@1136
EXIT

CHAIN IF ~True()~ THEN O#LLBAN3 b3
@1137
EXIT
