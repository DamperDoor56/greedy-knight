extends Area2D

@onready var game_manager = %"Game Manager"
@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_body_entered(_body):
	game_manager.add_coins()
	animation_player.play("pickup")
