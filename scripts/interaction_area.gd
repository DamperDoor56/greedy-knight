extends Area2D
class_name InteractionArea

@export var action_name: String = "read"
var interact: Callable = Callable()

func _on_body_entered(_body):
	InteractionManager.register_area(self)

func _on_body_exited(_body):
	InteractionManager.unregist_area(self)
