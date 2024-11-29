extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var health_bar: ProgressBar = $"Health Bar"
@onready var player_sprite = $AnimatedSprite2D
@onready var hurt_sound: AudioStream = preload("res://assets/sounds/hurt.wav")
@onready var audio_player = $AudioStreamPlayer2D


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var health: int = 3
var is_taking_damage: bool = false

# Take damage
func _take_damage():
	if is_taking_damage == true:
		player_sprite.play("hit") 
		#audio_player.play(hurt_sound)
		health -= 1
		health_bar.value = health
		await get_tree().create_timer(0.3).timeout
		is_taking_damage = false
	
func _on_hurt_zone_body_entered(body: Node2D) -> void:
	is_taking_damage = true
	_take_damage()

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
	if is_on_floor() && is_taking_damage == false:
		if direction == 0:
			player_sprite.play("idle")
		elif is_taking_damage == false:
			player_sprite.play("run")
	elif is_taking_damage == false:
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
