extends Sprite2D

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
	guest(
	"wiedźmo morska! jestem skończony.
	nie wiem jaka mnie przyszłość czeka.
	umiesz przepowiadać?
	pomórz mi")
	ball.disabled=false
	
func story0_1():
	guest(
	"czy będę bezpieczny na powierzchni?")
	a1(
	"nie,
	utoniesz nim dopłyniesz.
	powinieneś zostać na dnie i
	pomóc podwodnym mieszkańcom")
	a2("tak,
	na powierzchni znajdziesz tratwę")

func story0_fin():
	guest("dziękuje ci za pomoc,
	nie mam dużo ale proszę")
	timer.start()

func story1():
	guest(
	"o hejjjjj, widziałam że jakiś statek
	zatonął, ludzie są tacy piękni.
	chce wiedzieć czy mam przyszłość z
	pięknym nawigatorem który wpadł do wody")
	ball.disabled=false
	
func story1_1():
	guest(
	"i jak?")
	a2(
	"myślę że powinnaś iść
	za głosem serca")
	a1("powinnaś się poddać
	związki międzygatunkowe
	nigdy nie mają przyszłości")
	
func story2():
	guest(
	"prześladuje mnie syrena,
	ona ciągle za mną pływa")
	ball.disabled=false
	
func story2_1():
	guest(
	"jak to się skończy?")
	a2(
	"myśle że wszystko się ułoży")
	a1(
	"powinieneś jak najszybciej coś
	z tym zrobić, ona jest niebezpieczna")
	
func story3():
	guest("prześladuje mnie syrena, ona ciągle za mną pływa. nie wiem co robić")
	ball.disabled=false

func story3_1():
	guest("jak to się skończy?")
	a1("jeszcze trochę pocierpisz ale w końcu odpuści")
	a2("wróże wam wielką miłość! powinieneś ją bliżej poznać")

func story3_fin():
	if !marynarz:
		timer.start()
		return
	guest("hej, słyszałem coś o pięknej syrenie")
	await pc("tak, odkąd zobaczyła tego nawigatora nie może się odczepić")
	guest("myślisz... że mogę ją poznać?")
	await pc("nie rozumiesz że jest psychiczna?")
	guest("i can fix her")
	timer.start()

func story4():
	guest(
	"jestem strasznie głodny, musisz mi powróżyć")
	ball.disabled=false

func story4_1():
	guest(
		"czy znajdę przekąskę?"
	)
	a2(
		"tych wodach niestety nie, musisz poszukać gdzieś indziej"
	)
	a1(
		"okolicy pływa człowiek, przewiduje że w końcu go znajdziesz"
	)

func story4_fin():
	if navigator:
		guest(
			"haha udał mi się łów, niesamowite że rekin pływał tak blisko powierzchni. upoluje je wszystkie."
		)
	if shark:
		guest("och wiedźmo, czy mogę ukryć się tu przed rekinem?")
		await pc("dobrze")
		guest("wiesz... przed chwila zdawało mi się że umieram, a teraz jestem bezpieczny! dzięki ci o wielki żółwiu")
		await pc("żółwiu?")
		guest("potężna kreatura hehe, uratowała mnie")
		await pc("nie sądzę")
	else:
		guest("…")
	timer.start()

func story5():
	guest("ah tyle tej piany morskiej, nienawidzę jej. cały czas wchodzi mi w skrzela")
	await pc("co ja mam z tym zrobić?")
	guest("nie wiem, jesteś wiedźmą wyczaruj coś")
	ball.disabled=false

func story5_1():
	guest("czy pochłonie mnie ta trucizna?")
	a2("no nie wiem, takim rybom jak ty taka piana będzie szkodzić latami")
	a1("piana zniknie.. nie ma paniki")


func story5_fin():
	if fish:
		guest("czyli co? co jest powodem tej sytuacji?")
		await pc("tryton oczywiście")
		guest("wiedziałam")
	else:
		guest("ale kiedy?")
		await pc("niezbadane są wyniki przyszłości")
		guest("beznadziejna ta cała magia")
	timer.start()


func story6():
	guest(
		"wiedźmooooooo pomórz mi, zaraz zniknę, czuje że znikam"
	)
	ball.disabled = false

func story6_1():
	guest(
		"czy naprawdę zniknę?"
	)
	a2(
		"żesz odwrócić twój stan... wystarczy że będziesz się rozwijać"
	)
	a1(
		"niestety taka jest kolej rzeczy, szkoda"
	)
	
func story6_fin():
	if disappearing:
		guest(
			"to znaczy?"
		)
		await pc(
			"widzisz... pewna ryba jest zaczarowana, może odwrócić znikanie twojej piany"
		)
		guest(
			"jak? gdzie?"
		)
		await pc(
			"wyczuwam że... eeee"
		)
		guest(
			"nie ważne, muszę ją jak najszybciej znaleźć"
		)
	else:
		guest(
			"jak to! NIE TO NIEMOŻLIWE"
		)
		await pc(
			"sama widzisz że powoli znikasz"
		)
		guest(
			"ah tak"
		)
	timer.start()

func story7():
	guest(
		"mój żółw, jest moim najlepszym przyjacielem. chciałabym wiedzieć czy będziemy już ze sobą na zawsze!"
	)
	await pc(
		"co?"
	)
	guest(
		"coś nie tak wiedźmo?"
	)
	await pc(
		"mogę się przyjrzeć twojemu żółwiowi?"
	)
	guest(
		"nie! on jest moim przyjacielem NIE DOTYKAJ GO, mówię ci nie-do-ty-Kaj"
	)
	ball.disabled=false

	
func story7_1():
	guest(
		"to co mówi przyszłość?"
	)
	a2(
		"myślę że stanowicie słodka parę znajomych hehe, na zawsze zostaniecie razem"
	)
	a1(
		"ten żółw, jest... on"
	)
	
func story7_fin():
	if turtle:
		guest(
				"<żółw> dobry wybór śmiertelniku
				<girl> tak się cieszę! zostaniemy ze sobą na zawsze, tutaj na dnie morza"
			)
	else:
		await pc("ten żółw, jest... on")
		guest("he?")
		await pc("ON JEST JAKIMŚ STRASZNYM BYTEM! powinnaś go puścić")
	timer.start()
		
func story8():
	if not turtle:
		guest(
			"nawet nie wiesz z kim masz do czynienia!",	
		)
		await pc(
			"oj wiem bardzo dobrze"
		)
		guest(
			"spróbuj walczyć ze mną, no dalej popatrz w swoją kule i zobacz przyszłość"
		)
	else:
		guest(
			"dziękuje ze mnie nie wydałaś śmiertelniczko"
		)
		await pc(
			"nie ma za co..."
		)
		guest(
			"wyczuwam że chcesz mocy! razem możemy wprowadzić chaos w całym królestwie"
		)
	ball.disabled = false
	
func story8_1():
	guest("czy przyłączysz się do mnie?")
	a2("chce rządzić sama")
	a1("rządzmy razem!")
	
func story8_fin():
	if rule_alone:
		guest(
			"ah tak, wiedz wybierasz przegraną. Myślisz że kto napisał list o utracie poparcia u trytona?"
		)
		await pc(
			"nie ważne, przekazałeś mi to za darmo"
		)
		guest(
			"jeszcze zobaczysz "
		)
	timer.start()
	
	
func story9():
	guest(
		"witaj wiedźmo, przybyłem aby zapytać się o porade "
	)
	await pc(
		"poradę?"
	)
	guest(
		"usłyszałem że przepowiadasz przyszłość, patrze na nastroje, nie każdy wspiera trytona. chciałbym wiedzieć jaka jest ma przyszłość u jego boku"
	)
	await pc(
		"dobrze trafiłeś"
	)
	ball.disabled = true

func story9_1():
	guest(
		"co tam widzisz?"
	)
	a2(
		"widzę przed tobą świetlaną przyszłość"
	)
	a1(
		"widzę, widzę… bezrobocie"
	)

func story9_fin():
	if guide:
		guest(
			"tak?"
		)
		await pc(
			"ale tylko u mojego boku"
		)
		guest(
			"to znaczy?"
		)
		await pc(
			"jeśli pomożesz mi zdobyć stanowisko władcy mórz wszystko się ułoży"
		)
	else:
		guest(
			"he?"
		)
		await pc(
			"niedługo stracisz prace, nie ma rady "
		)
		guest(
			"wszystko jest bez sensu, odchodzę"
		)
	timer.start()


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
	answer_buble.hide()
	answer2_buble.hide()
	match scene:
		0:
			story0_fin()
		1:
			timer.start()
		2:
			timer.start()
		3:
			story3_fin()
		4:
			story4_fin()
		5:
			story5_fin()
		6:
			story6_fin()
		7: 
			story7_fin()
		8:
			story8_fin()
		9:
			story9_fin()

func _on_answer_2_button_down() -> void:
	answer_buble.hide()
	answer2_buble.hide()
	match scene:
		0:
			story0_fin()
		1:
			timer.start()
			syrena = true
		2:
			timer.start()
		3:
			story3_fin()
		4:
			story4_fin()
		5:
			story5_fin()
		6:
			story6_fin()
			disappearing = true
		7: 
			turtle = true
			story7_fin()
		8:
			rule_alone = true
			timer.start()


func _on_timer_timeout() -> void:
	timer.stop()
	scene+=1
	match scene:
		1:
			story1()
		2:
			if syrena:
				story2()
			else:
				scene+=1
				story3()
		3:
			scene+=1
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
			
		


func _on_button_button_down() -> void:
	emit_signal("clicked")
