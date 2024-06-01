extends Node

var is_alive = true
@onready var anim = get_node("collectable_animation_player")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Player" and is_alive:
		is_alive = false
		anim.play('death')
		G.handle_collectable.emit()


func _on_collectable_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "death":
		queue_free()
