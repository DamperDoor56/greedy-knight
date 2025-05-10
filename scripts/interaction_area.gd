extends Area2D
class_name InteractionArea

@export var action_name: String = "read"
var interact: Callable = Callable()
@onready var interaction_label: Label = $InteractionLabel

func _on_body_entered(_body):
	InteractionManager.register_area(self)
	interaction_label.hide()

func _on_body_exited(_body):
	InteractionManager.unregist_area(self)
	interaction_label.show()
