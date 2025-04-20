extends InteractionArea

func _ready():
	print("Ready knight")
	interact = Callable()

func _on_body_entered(body):
	InteractionManager.register_area(self)

func _on_body_exited(body):
	InteractionManager.unregist_area(self)
