extends Sprite2D

@onready var question_buble: Sprite2D = $Question
@onready var q_label: Label = $Question/Label
@onready var answer_buble: TextureButton = $Answer
@onready var a1_label: Label = $Answer/Label
@onready var answer2_buble: TextureButton = $Answer2
@onready var a2_label: Label = $Answer2/Label
@onready var ball: TextureButton = $"../Ball"
@onready var timer: Timer = $Timer


var scene = 0
var marynarz = false
var syrena = false
var navigator = false
var shark = false
var turtle = false
var rule_alone = false
var guide = false
var disappearing = false

func guest(tekst):
	q_label.text=tekst
	question_buble.show()

func pc(tekst):
	pass
	
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
	pc("tak, odkąd zobaczyła tego nawigatora nie może się odczepić")
	guest("myślisz... że mogę ją poznać?")
	pc("nie rozumiesz że jest psychiczna?")
	guest("i can fix her")
	timer.start()

func story4():
	guest(
	"jestem strasznie głodny, musisz mi powróżyć")
	ball.disabled=false

func story4_1():
	pass

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
		pc(
			"widzisz... pewna ryba jest zaczarowana, może odwrócić znikanie twojej piany"
		)
		guest(
			"jak? gdzie?"
		)
		pc(
			"wyczuwam że... eeee"
		)
		guest(
			"nie ważne, muszę ją jak najszybciej znaleźć"
		)
		return
	guest(
		"jak to! NIE TO NIEMOŻLIWE"
	)
	pc(
		"sama widzisz że powoli znikasz"
	)
	guest(
		"ah tak"
	)

func story7():
	guest(
		"mój żółw, jest moim najlepszym przyjacielem. chciałabym wiedzieć czy będziemy już ze sobą na zawsze!"
	)
	pc(
		"co?"
	)
	guest(
		"coś nie tak wiedźmo?"
	)
	pc(
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
		return
	pc("ten żółw, jest... on")
	guest("he?")
	pc("ON JEST JAKIMŚ STRASZNYM BYTEM! powinnaś go puścić")
		
func story8():
	if not turtle:
		guest(
			"nawet nie wiesz z kim masz do czynienia!",	
		)
		pc(
			"oj wiem bardzo dobrze"
		)
		guest(
			"spróbuj walczyć ze mną, no dalej popatrz w swoją kule i zobacz przyszłość"
		)
		ball.disabled = true
		return
	guest(
		"dziękuje ze mnie nie wydałaś śmiertelniczko"
	)
	pc(
		"nie ma za co..."
	)
	guest(
		"wyczuwam że chcesz mocy! razem możemy wprowadzić chaos w całym królestwie"
	)
	ball.disabled = true
	
func story8_1():
	guest("czy przyłączysz się do mnie?")
	a2("chce rządzić sama")
	a1("rządzmy razem!")
	
func story8_fin():
	if rule_alone:
		guest(
			"ah tak, wiedz wybierasz przegraną. Myślisz że kto napisał list o utracie poparcia u trytona?"
		)
		pc(
			"nie ważne, przekazałeś mi to za darmo"
		)
		guest(
			"jeszcze zobaczysz "
		)
		return
	
	
func story9():
	guest(
		"witaj wiedźmo, przybyłem aby zapytać się o porade "
	)
	pc(
		"poradę?"
	)
	guest(
		"usłyszałem że przepowiadasz przyszłość, patrze na nastroje, nie każdy wspiera trytona. chciałbym wiedzieć jaka jest ma przyszłość u jego boku"
	)
	pc(
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
		pc(
			"ale tylko u mojego boku"
		)
		guest(
			"to znaczy?"
		)
		pc(
			"jeśli pomożesz mi zdobyć stanowisko władcy mórz wszystko się ułoży"
		)
		return
	guest(
		"he?"
	)
	pc(
		"niedługo stracisz prace, nie ma rady "
	)
	guest(
		"wszystko jest bez sensu, odchodzę"
	)
		
		


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
		#4:
			#story4_fin()
		6:
			story6_fin()
		7: 
			story7_fin()
		8:
			timer.start()
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
			story2()
		3:
			story3()
		6:
			story7()
		4:
			story4()
		9:
			story9()
			
