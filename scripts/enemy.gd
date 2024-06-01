extends Node2D

const SPEED = 60

var direction = 1

@onready var ray_cast_2d_left = $RayCast2DLeft
@onready var ray_cast_2d_right = $RayCast2DRight

@onready var sprite_2d = $Sprite2D

@onready var melting_parts = $MeltingParts


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_2d_right.is_colliding():
		direction = -1
		sprite_2d.flip_h = true
	if ray_cast_2d_left.is_colliding():
		direction = 1
		sprite_2d.flip_h = false
	
	position.x += direction * SPEED * delta
	if melting_parts != null:
		print(melting_parts.get_child_count())
		if melting_parts.get_child_count() == 0:
			get_parent().queue_free()

func _on_killzone_area_entered(area:Area2D):
	pass # Replace with function body.
