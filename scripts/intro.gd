extends Node2D

@onready var images = [
	preload("res://assets/images/Komiks01.png"),
	preload("res://assets/images/Komiks02.png"),
	preload("res://assets/images/Komiks03.png"),
	preload("res://assets/images/Komiks04.png"),
	preload("res://assets/images/Komiks05.png"),
	preload("res://assets/images/Komiks06.png"),
	preload("res://assets/images/Komiks07.png"),
	preload("res://assets/images/Komiks08.png"),
	preload("res://assets/images/Komiks09.png"),
	preload("res://assets/images/Komiks10.png"),
	preload("res://assets/images/Komiks11.png"),
	preload("res://assets/images/Komiks12.png"),
	preload("res://assets/images/Komiks13.png"),
	preload("res://assets/images/Komiks14.png"),
	preload("res://assets/images/Komiks15.png"),
	preload("res://assets/images/Komiks16.png"),
	preload("res://assets/images/Komiks17.png"),
	preload("res://assets/images/Komiks18.png"),
	preload("res://assets/images/Komiks19.png"),
	preload("res://assets/images/Komiks20.png"),
]

@onready var index = 1
@onready var button = $TextureButton

func _ready():
	button.texture_normal = images[0]
	button.texture_hover = images[0]
	button.texture_pressed= images[0]
	AudioManager.play_music("story")


func _on_texture_button_pressed() -> void:
	AudioManager.play_effect("drop")
	if index < len(images) -1:
		index += 1
		button.texture_normal = images[index]
		button.texture_hover = images[index]
		button.texture_pressed = images[index]
		return
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
		
		
