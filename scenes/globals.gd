extends Node

signal pickup_scoop
signal player_died
signal handle_collectable
@export var score := 0

func _ready():
	G.connect("handle_collectable",Callable(self,"score_aa"))

func score_aa():
	score += 1
	print("New score: " + str(score))
	
func change_level(path):
	get_tree().change_scene_to_file(path)

