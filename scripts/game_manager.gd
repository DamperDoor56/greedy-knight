extends Node

@onready var score_label = $ScoreLabel
var score = 0

func add_coins():
	score += 1
	score_label.text = "Coleccionaste " + str(score) + " monedas! :D"
