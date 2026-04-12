extends Node2D
@onready var label = $ReturnButton/Label
@onready var page1 = $Dymki
@onready var page2 = $Kula
@onready var page3 = $Staty
@onready var pages = 1

func _ready():
	label.text = "Next"
	page1.show()

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
		hide()
	pages += 1
	print(pages)
