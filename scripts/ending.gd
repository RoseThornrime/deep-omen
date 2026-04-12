extends Node2D

@export var sound: String 
@onready var button = $ReturnButton
@onready var player1 = $AnimationPlayer
@onready var player2 = $AnimationPlayer2

func _ready():
	AudioManager.play_music(sound)
	button.show()
	player1.play("show_viz")
	player2.play("show_viz")
	await get_tree().create_timer(4).timeout
	button.disabled = false
	

func _on_return_button_pressed() -> void:
	AudioManager.play_effect("click")
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
