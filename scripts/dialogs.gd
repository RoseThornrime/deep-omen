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
var fish = false

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
		pc("dobrze")
		guest("wiesz... przed chwila zdawało mi się że umieram, a teraz jestem bezpieczny! dzięki ci o wielki żółwiu")
		pc("żółwiu?")
		guest("potężna kreatura hehe, uratowała mnie")
		pc("nie sądzę")
	else:
		guest("…")
	timer.start()

func story5():
	guest("ah tyle tej piany morskiej, nienawidzę jej. cały czas wchodzi mi w skrzela")
	pc("co ja mam z tym zrobić?")
	guest("nie wiem, jesteś wiedźmą wyczaruj coś")
	ball.disabled=false

func story5_1():
	guest("czy pochłonie mnie ta trucizna?")
	a2("no nie wiem, takim rybom jak ty taka piana będzie szkodzić latami")
	a1("piana zniknie.. nie ma paniki")


func story5_fin():
	if fish:
		guest("czyli co? co jest powodem tej sytuacji?")
		pc("tryton oczywiście")
		guest("wiedziałam")
	else:
		guest("ale kiedy?")
		pc("niezbadane są wyniki przyszłości")
		guest("beznadziejna ta cała magia")




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
		4:
			story4()
		5:
			story5()
		#6:
			#story6()
