extends Area2D
@onready var health_bar: ProgressBar = $"../../../Player/Health Bar"

var health: int = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health_bar.value = health
	
func _take_damage():
	health -= 1
	health_bar.value= health

func _on_body_entered(body):
	print(body)
	_take_damage()
