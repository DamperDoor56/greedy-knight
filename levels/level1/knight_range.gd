extends InteractionArea

@onready var interaction_label_knight: Label = $InteractionLabel

func _ready():
	interact = Callable()

func _on_body_entered(_body):
	InteractionManager.register_area(self)
	interaction_label_knight.hide()

func _on_body_exited(_body):
	InteractionManager.unregist_area(self)
	interaction_label_knight.show()
