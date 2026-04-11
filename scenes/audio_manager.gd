extends Node

@onready var ost = $OST
@onready var sfx = $SFX

@onready var music = {
	"menu": "res://assets/audio/ost/harp.mp3",
	"intro": "res://assets/audio/ost/water.wav",
	"ball": "res://assets/audio/ost/mystery.ogg",
	"game": "res://assets/audio/ost/witch.mp3"
}

@onready var effects = {
	"click": "res://assets/audio/sfx/Plop.ogg"
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
		add_child(player)
		player.stream = load(path)
		effect_players[name] = player
		
func play_effect(name):
	effect_players[name].play()
