extends Area2D

var speed = 400

func _physics_process(delta):
	position += Vector2(speed * delta,0).rotated(rotation)


func _on_visible_on_screen_notifier_2d_screen_exited():
	print("End")
	queue_free()
