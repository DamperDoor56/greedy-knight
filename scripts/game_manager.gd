extends Node

var score = 0
@onready var score_label: Label = $"../CanvasLayer2/ScoreLabel"

func add_coins():
	score += 1
	score_label.text = str(score)
