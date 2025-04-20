extends "res://scenes/slime_2.gd"

@onready var slime_sprite_smart: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right_smart: RayCast2D = $RayCastRight
@onready var ray_cast_left_smart: RayCast2D = $RayCastLeft

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player_pos
var target_pos
var previous_x_position: float = 0.0

func _physics_process(delta: float) -> void:
	player_pos = player.position.x
	var player_pos_y = player.position.y
	var distance = position.x - player_pos
	var distancey = position.y - player_pos_y
	if abs(distance) <= 60 and abs(distancey) <= 40:
		#print("It's close!")
		target_pos = Vector2(player_pos, position.y)
		var new_direction = (target_pos - position).normalized()
		position.x += speed * new_direction.x * delta
		
		if distance > 0:
			direction = -1
			slime_sprite_smart.flip_h = true
		else:
			direction = 1
			slime_sprite_smart.flip_h = false
	else:
		position.x += direction * speed * delta
	if ray_cast_right_smart.is_colliding():
		direction = -1
		slime_sprite_smart.flip_h = true
	if ray_cast_left_smart.is_colliding():
		direction = 1
		slime_sprite_smart.flip_h = false
