extends Node2D

@onready var timer = $Timer
@onready var players = []
	
func _ready():
	for child in get_children():
		if is_instance_of(child, AnimationPlayer):
			players.append(child)
	for player in players:	
		player.play("RESET")
	
func show_character():
	await get_tree().create_timer(1).timeout
	show()
	for player in players:	
		player.play("show_viz")
	
	
func hide_character():
	for player in players:	
		player.play("hide_viz")
	timer.start()
	

func _on_timer_timeout() -> void:
	timer.stop()
	hide()
