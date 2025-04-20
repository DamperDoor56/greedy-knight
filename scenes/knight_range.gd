extends Area2D

@export var action_name: String = "Talk"
@export var KnightInteraction: InteractionArea = InteractionArea.new()

var interact: Callable = Callable()

func _ready():
	add_child(KnightInteraction)
	KnightInteraction.interact = Callable(KnightInteraction, "_on_knight_interact")

func _on_body_entered(body: Node2D) -> void:
	InteractionManager.register_area(KnightInteraction)

func _on_body_exited(body: Node2D) -> void:
	InteractionManager.unregist_area(KnightInteraction)
