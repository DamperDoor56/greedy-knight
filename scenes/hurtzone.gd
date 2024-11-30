extends Area2D
@onready var health_bar: ProgressBar = $"../../../Player/Health Bar"
@onready var player_sprite: AnimatedSprite2D = $"../../../Player/AnimatedSprite2D"

var health: int = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health_bar.value = health
