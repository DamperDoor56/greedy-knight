extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var health_bar: ProgressBar = $"Health Bar"
@onready var player_sprite = $AnimatedSprite2D
@onready var hurt_sound: AudioStreamPlayer2D = $HurtSound
@onready var jump_sound: AudioStreamPlayer2D = $JumpSound
@onready var death_timer: Timer = $DeathTimer

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var health: int = 3
var is_taking_damage: bool = false

# Take damage
func _take_damage():
	if is_taking_damage == true:
		player_sprite.play("hit") 
		hurt_sound.play()
		health -= 1
		health_bar.value = health
		await get_tree().create_timer(0.3).timeout
		is_taking_damage = false
	

func _on_hurt_zone_body_entered(body: Node2D) -> void:
	is_taking_damage = true
	_take_damage()
	if health == 0:  
		body.get_node("CollisionShape2D").queue_free()
		Engine.time_scale = 0.3
		await get_tree().create_timer(0.8).timeout
		get_tree().reload_current_scene()
		Engine.time_scale = 1

func _physics_process(delta):
	if DialogManager.is_dialog_active:
		return
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump_sound.play()
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
