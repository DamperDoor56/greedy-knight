extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var player_sprite = $AnimatedSprite2D
# @onready var interaction_area: InteractionArea = $InteractionArea

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var currentHealth: int = 3

#func _ready():
#	interaction_area.interact = Callable(self, "_on_interact" )

#func _on_interact():
#	DialogManager.start_dialog(global_position, lines, speech_sound)
#	sprite.flip_h = true if interaction_area.get_overlapping_bodies()[0].global_position.x < global_position.x

func _physics_process(delta):
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
