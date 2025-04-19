extends Area2D
@onready var player: CharacterBody2D = $"../../../Player"
@onready var jump_sound: AudioStreamPlayer2D = $"../../../Player/JumpSound"
@onready var bouce_fungui_animation: AnimatedSprite2D = $"../BouceFunguiAnimation"

func _on_body_entered(body: Node2D) -> void:
	if (body == player):
		jump_sound.play()
		body.velocity.y = -600
		bouce_fungui_animation.play("bounce")
		await get_tree().create_timer(1).timeout
		bouce_fungui_animation.play("idle")
