extends Node

signal pickup_scoop
signal player_died
signal handle_collectable
@export var score := 0
const SCOOPS_NEEDED = 1
const VAN = preload("res://mobs/van.tscn")
func _ready():
	G.connect("handle_collectable",Callable(self,"score_aa"))

func score_aa():
	score += 1
	print("New score: " + str(score))
	if score == SCOOPS_NEEDED:
		var new_van = VAN.instantiate()
		add_child(new_van)
		new_van.position = Vector2(0, 400)  # Set the desired position here
		score = 0
	
func change_level(path):
	get_tree().change_scene_to_file(path)

