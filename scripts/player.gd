extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var player_sprite = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

	
func _physics_process(delta):
	if DialogManager.is_dialog_active:
		return
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Gets the input direction
	var direction = Input.get_axis("move_left", "move_right")
	
	# Flip the Sprite:
	if direction > 0:
		player_sprite.flip_h = false
	elif direction < 0:
		player_sprite.flip_h = true
	
	# Play animations
	if is_on_floor():
		if direction == 0:
			player_sprite.play("idle")
		else:
			player_sprite.play("run")
	else:
		player_sprite.play("jump")
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	#or index in get_slide_collision_count():
		#ar collision := get_slide_collision(index)
		#ar body := collision.get_collider()
		#rint("Collided with: ", body.name)
