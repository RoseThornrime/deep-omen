extends Node

@onready var ost = $OST
@onready var sfx = $SFX

@onready var music = {
	"menu": "res://assets/audio/ost/harp.mp3",
	"win": "res://assets/audio/ost/water.mp3",
	"ball": "res://assets/audio/ost/mystery.ogg",
	"game": "res://assets/audio/ost/witch.mp3",
	"loss": "res://assets/audio/ost/loss.ogg",
	"chaos": "res://assets/audio/ost/apocalyptic.mp3",
	"story": "res://assets/audio/ost/story.mp3"
}

@onready var effects = {
	"click": "res://assets/audio/sfx/Plop.ogg",
	"drop": "res://assets/audio/sfx/Drop.mp3",
	"crystal": "res://assets/audio/sfx/Crystal.mp3",
	"vision": "res://assets/audio/sfx/Vision.mp3",
	"scream": "res://assets/audio/sfx/scream_horror1.mp3"
}

var effect_players = {}

func play_music(name):
	ost.stop()
	ost.stream = load(music[name])
	ost.stream.loop = true
	ost.play()
	
func _ready():
	for name in effects.keys():
		var path = effects[name]
		var player = AudioStreamPlayer.new()
		player.bus = "Effects"
		add_child(player)
		player.stream = load(path)
		effect_players[name] = player
		
func play_effect(name):
	effect_players[name].play()
	
func set_music_volume(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(value))

func set_effects_volume(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Effects"), linear_to_db(value))
	
	
