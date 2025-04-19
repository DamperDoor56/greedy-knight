extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var sprite_2d = $Sprite2D
@onready var speech_sound = preload("res://assets/sounds/voice_sample.wav")

const lines: Array[String] = [
	"Hello! Welcome",
	"Have at it! These are for you",
	"Also, use the mushroom to jump back!"
]

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	DialogManager.start_dialog(global_position, lines, speech_sound)
	await DialogManager.dialog_finished
