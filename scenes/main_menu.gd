extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_pressed():
	G.change_level("res://scenes/levels/level_1.tscn")
	pass # Replace with function body.


func _on_button_3_pressed():
	G.change_level("res://scenes/intro.tscn")
	pass # Replace with function body.


func _on_button_4_pressed():
	$Team.visible = false
	$Button.visible = true
	pass # Replace with function body.


func _on_button_2_pressed():
	$Team.visible = true
	$Button.visible = false
	pass # Replace with function body.
