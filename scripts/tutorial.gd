extends Node2D
@onready var label = $ReturnButton/Label
@onready var page1 = $Dymki
@onready var page2 = $Kula
@onready var page3 = $Staty
@onready var pages = 1

func show_tutorial():
	label.text = "Next"
	pages = 1
	page1.show()

func _ready():
	show_tutorial()	

func _on_return_button_pressed() -> void:
	AudioManager.play_effect("click")
	if pages == 1:
		page1.hide()
		page2.show()
	elif pages == 2:
		page2.hide()
		page3.show()
		label.text = "Return"
	else:
		page3.hide()
		hide()
		return
	pages += 1
