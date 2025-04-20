extends Node2D

@onready var speech_sound = preload("res://assets/sounds/voice_sample.wav")
@onready var knight_range: InteractionArea = $KnightRange

const lines: Array[String] = [
	"Hello, fellow companion",
	"We need to rescue the emperor",
	"You need to collect all the coins",
	"To open the portal",
	"What? Is perfectly normal",
	"Start with the coin next to me",
	"Hail the emperor!",
]

func _ready():
	knight_range.interact = Callable(self, "_on_knight_interact") 
	
func _on_knight_interact():
	DialogManager.start_dialog(global_position, lines, speech_sound)
	await DialogManager.dialog_finished
