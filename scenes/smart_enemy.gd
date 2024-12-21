extends "res://scenes/slime_2.gd"
@onready var slime_sprite_smart: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right_smart: RayCast2D = $RayCastRight
@onready var ray_cast_left_smart: RayCast2D = $RayCastLeft

var player_pos
var target_pos
var previous_x_position: float = 0.0

func _physics_process(delta: float) -> void:
	player_pos = player.position.x
	if abs(position.x - player_pos) <= 60:
		print("It's close!")
		var target_pos = Vector2(player_pos, position.y)
		var new_direction = (target_pos - position).normalized()
		position.x += speed * new_direction.x * delta
	else:
		print("It's not close!")
		position.x += direction * speed * delta
	if ray_cast_right_smart.is_colliding():
		direction = -1
		slime_sprite_smart.flip_h = true
	if ray_cast_left_smart.is_colliding():
		direction = 1
		slime_sprite_smart.flip_h = false
