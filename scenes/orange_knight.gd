extends Node2D

@onready var sprite_2d = $Sprite2D
@onready var speech_sound = preload("res://assets/sounds/voice_sample.wav")
@onready var knight_range: Area2D = $KnightRange

const lines: Array[String] = [
	"Hello, fellow companion",
	"We need to rescue the emperor",
	"You need to collect all the coins",
	"To open the portal",
	"What? Is perfectly normal",
	"Try with the coin next to me",
	"Hail the emperor!",
]

func _ready():
		knight_range.KnightInteraction.interact = Callable(self, "_on_interact")

func _on_interact():
	DialogManager.start_dialog(global_position, lines, speech_sound)
	await DialogManager.dialog_finished
