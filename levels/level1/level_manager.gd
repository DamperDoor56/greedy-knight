extends Area2D
@onready var player: CharacterBody2D = $"../Player"


func _on_body_entered(body: Node2D) -> void:
	print(body == player)
	if body == player:
		var current_scene = get_tree().current_scene.scene_file_path
		print(current_scene)
		print(current_scene.to_int())
		var next_level_int = current_scene.to_int() + 1
		var next_level_path = "res://levels/level"+ str(next_level_int) + "/level.tscn"
		print(next_level_path)
		get_tree().change_scene_to_file(next_level_path)
