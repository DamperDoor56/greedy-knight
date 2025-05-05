extends Node2D

@onready var speech_sound = preload("res://assets/sounds/voice_sample.wav")
@onready var interaction_area_sign: InteractionArea = $InteractionAreaSign

const lines : Array[String] = [
	"Hello! Welcome",
	"Have at it! These are for you",
	"Also, use the mushroom to jump back!"
]

func _ready():
	if interaction_area_sign:
		interaction_area_sign.interact = Callable(self, "_on_interact")

func _on_interact():
	DialogManager.start_dialog(global_position, lines, speech_sound)
	await DialogManager.dialog_finished
