extends TextureButton

@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var textures = [
	preload("res://assets/images/wizja_tratwa.png"),
	preload("res://assets/images/wizja_smutna_syrenka.png"),
	preload("res://assets/images/wizja_wolnosc.png"),
	preload("res://assets/images/wizja_slub.png"),
	preload("res://assets/images/wizja_happymeal.png"),
	preload("res://assets/images/wizja_piana.png"),
	#preload("res://assets/images/wizja_piana.png"),
	#preload("res://assets/images/wizja_zolw.png"),
	preload("res://assets/images/wizja_zolw.png"),
	preload("res://assets/images/wizja_zwolnienie.png"),
]

func _ready() -> void:
	disabled=true
	animation_player.play("RESET")
	
func show_vision(n):
	texture_normal=textures[n]
	show()
	animation_player.play("show_viz")
	timer.start()

func _on_timer_timeout() -> void:
	timer.stop()
	disabled=false

func _on_button_down() -> void:
	disabled=true
	animation_player.play("hide_viz")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "hide_viz":
		hide()
