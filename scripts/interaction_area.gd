extends Area2D
class_name InteractionArea

@export var action_name: String = "leer"
var interact: Callable = Callable()

func _on_body_entered(body):
	print(interact)
	InteractionManager.register_area(self)

func _on_body_exited(body):
	InteractionManager.unregist_area(self)
