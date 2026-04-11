extends Node2D

@onready var options = $Options
@onready var credits = $Credits
@onready var tutorial = $Tutorial

@onready var bubble_active = false

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_options_pressed() -> void:
	if(bubble_active):
		return
	options.hidden = false
	bubble_active = true
	get_tree().change_scene_to_file("res://scenes/options.tscn")

func _on_credits_pressed() -> void:
	if(bubble_active):
		return
	credits.hidden = false
	bubble_active = true
	get_tree().change_scene_to_file("res://scenes/credits.tscn")

func _on_tutorial_pressed() -> void:
	if(bubble_active):
		return
	tutorial.hidden = false
	bubble_active = true
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
