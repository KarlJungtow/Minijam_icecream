extends Node

signal pickup_scoop

func _ready():
	pass
	
	
func change_level(path):
	get_tree().change_scene_to_file(path)

