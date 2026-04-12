extends Sprite2D

@onready var game: Node2D = $".."
@onready var question_buble: Sprite2D = $Question
@onready var q_label: Label = $Question/Label
@onready var answer_buble: TextureButton = $Answer
@onready var a1_label: Label = $Answer/Label
@onready var answer2_buble: TextureButton = $Answer2
@onready var a2_label: Label = $Answer2/Label
@onready var ball: TextureButton = $"../Ball"
@onready var timer: Timer = $Timer
@onready var pc_buble: TextureButton = $Button
@onready var pc_label: Label = $Label

@onready var characters = {
	"rozbitek": $"../Rozbitek",
	"syrena": $"../Syrena",
	"ranny": $"../Ranny",
	"martwy": $"../Martwy",
	"nawigator": $"../Nawigator",
	"doradca": $"../Doradca",
	"ryba": $"../Ryba",
	"dziewczynka": $"../Dziewczynka",
	"zolw": $"../Zolw",
	"rekin": $"../Rekin",
	"piana": $"../Piana"
}

var scene = 0
var marynarz = false
var syrena = false
var navigator = false
var shark = false
var turtle = false
var rule_alone = false
var guide = false
var disappearing = false
var fish = false

signal clicked

func end_game(ending):
	if ending == "chaos":
		get_tree().change_scene_to_file("res://scenes/endings/chaos_ending.tscn")
		return
	if ending == "good":
		get_tree().change_scene_to_file("res://scenes/endings/good_ending.tscn")
		return		
	if ending == "goodturtle":
		get_tree().change_scene_to_file("res://scenes/endings/good_turtle_ending.tscn")
		return
	if ending == "bad":
		get_tree().change_scene_to_file("res://scenes/endings/bad_ending.tscn")
		return
	if ending == "badturtle":
		get_tree().change_scene_to_file("res://scenes/endings/bad_turtle_ending.tscn")
		return

func guest(tekst):
	q_label.text=tekst
	question_buble.show()
	await get_tree().create_timer(0.3).timeout

func pc(tekst):
	pc_label.text = tekst
	pc_buble.show()
	pc_label.show()
	await self.clicked
	pc_buble.hide()
	pc_label.hide()
	
func a1(tekst):
	a1_label.text=tekst
	answer_buble.show()
	
func a2(tekst):
	a2_label.text=tekst
	answer2_buble.show()

func _ready() -> void:
	characters["rozbitek"].show_character()
	await get_tree().create_timer(4).timeout
	guest(
	"Sea Witch! I'm done for.
	I don't know what my fate will
	bring to me. You're a fortune
	teller, aren't you? Help me.")
	ball.disabled=false
	
func story0_1():
	guest(
	"Am I going to be save
	on Surface?")
	a2(
	"No, you're going to drawn
	before you reach the surface.
	You should stay at the bottom
	of the sea and help its
	residents.")
	a1("Yes, you will find a raft
	above surface")

func story0_fin():
	guest("Thank you for your help.
	It's not much, but that's
	for you")
	timer.start()

func story1():
	characters["rozbitek"].hide_character()
	characters["syrena"].show_character()
	await get_tree().create_timer(4).timeout
	guest(
	"Oh hiii, I saw a ship sinking.
	Humans are so beautiful. I'd
	like to know if there's future
	for me and handsome nawigator
	that fell into water?")
	ball.disabled=false
	
func story1_1():
	guest(
	"So?")
	a2(
	"I think you should follow
	your heart.")
	a1("You should give up,
	interspecies relationships
	have no future.")
	
func story2():
	characters["syrena"].hide_character()
	characters["nawigator"].show_character()
	await get_tree().create_timer(4).timeout
	guest(
	"I'm being stalked by a mermaid,
	she folows me everywhere!")
	ball.disabled=false
	
func story2_1():
	guest(
	"How's it going to end?")
	a2(
	"I think everything is
	going to be fine.")
	a1(
	"You should do something
	about her as soon as
	possible, she's dangerous.")
	
func story2_fin():
	if !marynarz:
		guest("Is that so? Phew, thank
		you, I feel relieved.")
		game.update_chaos(10)
	else:
		guest("Just as I thought… This
		whole underwater fauna
		is seriously coo-coo. It's
		time to take care of this.")
		game.update_ppl(10)
	timer.start()
	
func story3():
	characters["syrena"].hide_character()
	characters["nawigator"].show_character()
	await get_tree().create_timer(4).timeout
	guest("I'm being stalked by a mermaid,
	she folows me everywhere! What
	should I do?")
	ball.disabled=false

func story3_1():
	guest("How's it going to end?")
	a1("You're going to suffer
	a little more, but she
	will let go in the end.")
	a2("I can see great love
	between you two! You
	should get to know her
	better.")

func story3_fin():
	if marynarz:
		if navigator:
			timer.start()
			game.update_ppl(10)
			return
		characters["nawigator"].hide_character()
		characters["rozbitek"].show_character()
		await get_tree().create_timer(4).timeout
		guest("Hey, I've heard something
		about beautiful mermaid")
		await pc("Yes, since she saw that
		navigator she doesn't want
		to let go.")
		guest("Do you think… I could
		meet her?")
		await pc("Don't you understand she's
		a lunatic?")
		guest("I can fix her!")
		characters["rozbitek"].hide_character()
		game.update_ppl(20)
	else:
		game.update_ppl(-20)
	timer.start()

func story4():
	characters["nawigator"].hide_character()
	characters["rekin"].show_character()
	await get_tree().create_timer(4).timeout
	guest(
	"I'm terribly hungry, you gotta
	help me")
	ball.disabled=false

func story4_1():
	guest(
	"Am I going to find a snack?"
	)
	a2(
	"Not in those waters,
	you gotta look somewhere
	else"
	)
	a1(
	"Some random man is swimming
	around, you will find
	him soon"
	)

func story4_fin():
	if !shark:
		characters["rekin"].hide_character()
		characters["ranny"].show_character()
		await get_tree().create_timer(4).timeout
		guest("Oh, witch! Can I hide from
		shark here?")
		await pc("Fine")
		guest("You know… just moments
		ago I thought I was dying
		and now I'm safe! All hail
		to the Great Turtle!")
		await pc("Turtle?")
		guest("Powerful creature, hehe.
		It saved me")
		await pc("I don't think so…")
	else:
		if navigator:
			characters["rekin"].hide_character()
			characters["nawigator"].show_character()
			await get_tree().create_timer(4).timeout
			guest(
			"Haha, I made it! 
			Unbelievable this shark
			was swimming so close to
			the Surface. I gotta
			catch'em all!"
			)
		else:
			characters["rekin"].hide_character()
			characters["martwy"].show_character()
			await get_tree().create_timer(4).timeout
			guest("…")
	timer.start()

func story5():
	if !shark:
		characters["ranny"].hide_character()
	elif navigator:
		characters["nawigator"].hide_character()
	else:
		characters["martwy"].hide_character()
	characters["ryba"].show_character()
	await get_tree().create_timer(4).timeout
	guest("Ah, this seafoam is everywhere!
	I hate it, it gets in my gills
	all the time!")
	await pc("And what does it have to do
	with me?")
	guest("I don't know! You're the witch,
	do some magic or whatever")
	ball.disabled=false

func story5_1():
	guest("Is this thing going
	to poison me?")
	a2("Well, I don't know, this
	foam might harm fishes
	like you for years")
	a1("Seafoam is going
	to disappear… don't panic")


func story5_fin():
	if fish:
		guest("So what? What's the reason
		for this situation?")
		await pc("Triton of course")
		guest("I knew it!")
	else:
		guest("But when?")
		await pc("You never know, sometime
		in the future")
		guest("Wow, this whole magic
		thing sucks")
	timer.start()


func story6():
	characters["ryba"].hide_character()
	characters["piana"].show_character()
	await get_tree().create_timer(4).timeout
	guest(
		"Wiiitch, help me, I'm going
		to disappear, I can feel it!"
	)
	ball.disabled = false

func story6_1():
	guest(
		"Am I really going to disappear??"
	)
	a2(
		"To reverse your state…
		You just have to evolve"
	)
	a1(
		"I'm sorry, that's what
		we call the circle
		of life. Shame"
	)
	
func story6_fin():
	if disappearing:
		guest(
			"What do you mean?"
		)
		await pc(
			"You see… there's magical
			fish outh there. It can
			shift your condition."
		)
		guest(
			"How? Where?"
		)
		await pc(
			"I can feel that… uhhhh"
		)
		guest(
			"Nevermind, I need to find
			it as soon as possible!"
		)
	else:
		guest(
			"What?! IT'S IMPOSSIBLE!"
		)
		await pc(
			"You alread know, you're
			slowly disappearing"
		)
		guest(
			"Ah yes…"
		)
	timer.start()

func story7():
	characters["piana"].hide_character()
	characters["dziewczynka"].show_character()
	await get_tree().create_timer(4).timeout
	guest(
		"My turtle is my best friend!
		I'd like to know if we're gonna
		stay together forever!"
	)
	await pc(
		"What?"
	)
	guest(
		"Is something wrong witch?"
	)
	await pc(
		"Can I take a closer look
		at your turtle?"
	)
	guest(
		"No! He's my friend, DON'T
		touch him. I'm telling
		you, DO-NOT-TOUCH."
	)
	$"../jumpscare".show()
	await get_tree().create_timer(0.3).timeout
	$"../jumpscare".hide()
	
	ball.disabled=false

	
func story7_1():
	guest(
		"What does the future bring?"
	)
	a2(
		"I think you're cute
		friends, hehe. You're
		going to stay together
		forever."
	)
	a1(
		"This turtle is… it's…"
	)
	
func story7_fin():
	if turtle:
		guest(
				"<Turtle> Good answer, mortal.
				<Girl> I'm so happy! We're
				going to be together
				forever, here at
				the bottom of the sea!"
			)
	else:
		guest("Huh?")
		await pc("IT'S SOME HORRIFYING
		ENTITY! You should
		let it go!")
	timer.start()
		
func story8():
	characters["dziewczynka"].hide_character()
	characters["zolw"].show_character()
	await get_tree().create_timer(4).timeout
	if not turtle:
		guest(
			"You have no idea with
			whom you're messing with!"
		)
		await pc(
			"Oh, I know very well."
		)
		guest(
			"Fight me. Go on, look
			into your cristal ball
			and see the future"
		)
		if game.ppl*game.fauna<game.chaos:
			end_game("chaos")
		else:
			await pc("Uff, i won
			Luckly he was not strong enought for me")
			timer.start()
			return
	else:
		guest(
			"Thank you for keeping
			my secret, mortal"
		)
		await pc(
			"You're welcome…"
		)
		guest(
			"I can feel you desire
			power! Together we can
			set this kingdom in chaos"
		)
	ball.disabled = false
	
func story8_1():
	guest("Will you join me?")
	a2("I want to rule all by myself")
	a1("Let's rule together!")
	
func story8_fin():
	if rule_alone:
		guest(
			"Is that so? You should
			know you're going to fail.
			Who do you think wrote
			that letter about Triton
			loosing followers?"
		)
		await pc(
			"It doesn't matter,
			you gave it to me for free"
		)
		guest(
			"Oh, you will regret
			it, just wait."
		)
		if game.ppl*game.fauna<game.chaos:
			end_game("chaos")
	timer.start()
	
	
func story9():
	characters["zolw"].hide_character()
	characters["doradca"].show_character()
	await get_tree().create_timer(4).timeout
	guest(
		"Greetings witch, I came to ask
		for your advice"
	)
	await pc(
		"Advice?"
	)
	guest(
		"I've heard you can see future,
		I can see that not everyone
		agrees with Triton.
		I'd like how my future looks
		like, staying by his side."
	)
	await pc(
		"You're in the right place"
	)
	ball.disabled = true

func story9_1():
	guest(
		"What can you see?"
	)
	a2(
		"I can see bright future
		in front of you"
	)
	a1(
		"I can see, I can see…
		you're jobless"
	)

func story9_fin():
	if guide:
		guest(
			"Yes?"
		)
		await pc(
			"But only by my side"
		)
		guest(
			"What do you mean?"
		)
		await pc(
			"If you help me get
			the throne of Underwater
			Kingdom everything
			is going to work out"
		)
	else:
		guest(
			"Huh?"
		)
		await pc(
			"You're going to lose
			your job soon, there's
			no other way"
		)
		guest(
			"This makes no sense,
			I'm leaving!"
		)
	timer.start()
	
func ending():
	if rule_alone:
		if game.chaos>80:
			end_game("bad")
		else:
			end_game("good")
	else:
		if game.chaos>80:
			end_game("badturtle")
		else:
			end_game("goodturtle")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "hide_viz":
		match scene:
			0:
				story0_1()
			1:
				story1_1()
			2:
				story2_1()
			3:
				story3_1()
			4:
				story4_1()
			5:
				story5_1()
			6:
				story6_1()
			7:
				story7_1()
			8:
				story8_1()
			9:
				story9_1()

func _on_answer_button_down() -> void:
	AudioManager.play_effect("click")
	answer_buble.hide()
	answer2_buble.hide()
	match scene:
		0:
			game.update_ppl(20)
			story0_fin()
		1:
			timer.start()
			game.update_fauna(-30)
		2:
			story2_fin()
			navigator=true
		3:
			story3_fin()
			navigator=true
		4:
			game.update_fauna(20)
			shark = true
			story4_fin()
		5:
			game.update_fauna(20)
			story5_fin()
		6:
			game.update_fauna(-20)
			story6_fin()
		7: 
			game.update_ppl(-10)
			game.update_chaos(10)
			story7_fin()
		8:
			story8_fin()
		9:
			game.update_ppl(15)
			story9_fin()

func _on_answer_2_button_down() -> void:
	AudioManager.play_effect("click")
	answer_buble.hide()
	answer2_buble.hide()
	match scene:
		0:
			game.update_fauna(20)
			marynarz=true
			story0_fin()
		1:
			timer.start()
			syrena = true
			game.update_fauna(20)
			game.update_chaos(10)
		2:
			story2_fin()
		3:
			story3_fin()
		4:
			game.update_ppl(20)
			story4_fin()
		5:
			game.update_chaos(10)
			story5_fin()
		6:
			game.update_fauna(20)
			game.update_chaos(20)
			story6_fin()
			disappearing = true
		7: 
			turtle = true
			game.update_ppl(10)
			story7_fin()
		8:
			rule_alone = true
			timer.start()
		9:
			game.update_fauna(15)
			story9_fin()

func _on_timer_timeout() -> void:
	timer.stop()
	question_buble.hide()
	scene+=1
	match scene:
		1:
			story1()
		2:
			if syrena:
				story2()
			else:
				scene+=1
				game.vision_nr+=1
				story3()
		3:
			scene+=1
			game.vision_nr+=1
			story4()
		4:
			story4()
		5:
			story5()
		6:
			story6()
		7:
			story7()
		8:
			story8()
		9:
			story9()
		10:
			ending()
			
	

func _on_button_button_down() -> void:
	emit_signal("clicked")
