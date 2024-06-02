extends Area2D

@onready var enemies = $enemies

func _ready():
	$AnimatedSprite2D.play("default")


func _physics_process(delta):
	position.x += delta * 400
	

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_entered(area):
	if area.is_in_group("enemy"):
		area.queue_free()
	

