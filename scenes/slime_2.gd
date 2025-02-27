extends CharacterBody2D

const speed = 30

var direction = 1

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var slime_sprite = $AnimatedSprite2D
@onready var health_bar: ProgressBar = $"../../Player/Health Bar"
@onready var player: CharacterBody2D = $"../../Player"

var health = 3

func _substract_health():
	health_bar.value = health
	health -= 1

func _on_body_entered(body:Node):
	print(body, " entered")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(ray_cast_left and ray_cast_right):
		if ray_cast_right.is_colliding():
			direction = -1
			slime_sprite.flip_h = true
		if ray_cast_left.is_colliding():
			direction = 1
			slime_sprite.flip_h = false
		position.x += direction * speed * delta
	else:
		pass
