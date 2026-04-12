extends Node2D


func _on_return_button_2_pressed() -> void:
	AudioManager.play_effect("click")
	hide()
