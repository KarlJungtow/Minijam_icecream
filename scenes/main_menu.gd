extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	G.change_level("res://scenes/test_level.tscn")
	pass # Replace with function body.


func _on_button_3_pressed():
	G.change_level("res://scenes/intro.tscn")
	pass # Replace with function body.
