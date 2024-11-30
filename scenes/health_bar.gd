extends ProgressBar

@onready var health_bar: ProgressBar = $"."
var health = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health_bar.value = health

func _restore_health():
	health += 1
	health_bar.value= health
	
func _take_damage():
	health -= 1
	health_bar.value= health
