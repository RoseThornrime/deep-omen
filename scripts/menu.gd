extends Node2D

@onready var options = $Options
@onready var credits = $Credits
@onready var tutorial = $Tutorial

@onready var start_btn = $StartButton
@onready var options_btn = $OptionsButton
@onready var credits_btn = $CreditsButton
@onready var tutorial_btn = $TutorialButton


func hide_buttons():
	start_btn.hide()
	options_btn.hide()
	credits_btn.hide()
	tutorial_btn.hide()

func show_buttons():
	start_btn.show()
	options_btn.show()
	credits_btn.show()
	tutorial_btn.show()
		
	

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_options_pressed() -> void:
	options.show()
	hide_buttons()

func _on_credits_pressed() -> void:
	credits.show()
	hide_buttons()

func _on_tutorial_pressed() -> void:
	tutorial.show()
	hide_buttons()
