@tool
extends RigidBody2D
@export var id: int = 0
var texture


# Called when the node enters the scene tree for the first time.
func _ready():
	load_texture()

func load_texture():
	if id < 10:
		texture = load("res://assets/ChocolateEnemy/tile00" + str(id) + ".png")
	elif id >= 10:
		texture = load("res://assets/ChocolateEnemy/tile0" + str(id) + ".png")
	$Area2D/Sprite2D.texture = texture

func _on_area_2d_area_entered(area):
	if area.name == "Flame":
		#remove_child(self) 
		area.queue_free()
		top_level = true
		apply_impulse(Vector2(randf_range(-10,10),randf_range(-10,10)))
		
		$CollisionShape2D.disabled = true
		
		await get_tree().create_timer(0.5).timeout
		
		queue_free()
		


func _on_property_list_changed():
	load_texture()
