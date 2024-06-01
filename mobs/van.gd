extends Area2D

@onready var enemies = $"../Enemies"
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	position.x += delta * 200
	if enemies != null:
		var children = enemies.get_children()
		if children != null:
			for child in children:
				if position.x > child.position.x:
					child.queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	print(body.name)
