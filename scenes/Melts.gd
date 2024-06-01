extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	if area.name == "Flame":
		#remove_child(self) 
		top_level = true
		area.queue_free()
		
		await get_tree().create_timer(0.1).timeout
		queue_free()
		
