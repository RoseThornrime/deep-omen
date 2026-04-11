extends Node2D

@onready var effects = $Effects
@onready var music = $Music

func _on_return_button_pressed() -> void:
	AudioManager.play_effect("click")
	hide()


func _on_effects_value_changed(value: float) -> void:
	AudioManager.set_effects_volume(value / 100.0)


func _on_music_value_changed(value: float) -> void:
	AudioManager.set_music_volume(value / 100.0)
