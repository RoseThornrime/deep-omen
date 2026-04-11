extends Sprite2D

@onready var question_buble: Sprite2D = $Question
@onready var q_label: Label = $Question/Label
@onready var answer_buble: TextureButton = $Answer
@onready var a1_label: Label = $Answer/Label
@onready var answer2_buble: TextureButton = $Answer2
@onready var a2_label: Label = $Answer2/Label

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

func story0():
	guest("wiedźmo morska! jestem skończony. nie wiem jaka mnie przyszłość czeka. umiesz przepowiadać? pomórz mi")

func story0_1():
	guest("czy będę bezpieczny na powierzchni?")
	a1("nie, utoniesz nim dopłyniesz. powinieneś zostać na dnie i pomóc podwodnym mieszkańcom")
	a2("tak, na powierzchni znajdziesz tratwę")

func story0_fin():
	guest("dziękuje ci za pomoc, nie mam dużo ale proszę")
