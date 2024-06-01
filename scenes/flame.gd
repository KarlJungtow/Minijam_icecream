extends Area2D

var speed = 400

func _ready():
	if randi_range(0,1) == 0:
		$Fire.flip_v = true

func _physics_process(delta):
	position += Vector2(speed * delta,0).rotated(rotation)

 
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
