extends Area2D

var player_in = false
var player_pos: Vector2
var can_scoop = true

func _ready():
	G.connect("player_scoop_attack",Callable(self,"handle_player_scoop"))

func handle_player_scoop():
	if player_in:
		if can_scoop:
			can_scoop = false
			G.handle_collectable.emit(player_pos)
			$AnimationPlayer.play("death")
			$Sprite2D/CPUParticles2D.emitting = true

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "death":
		queue_free()


func _on_area_entered(area):
	if area.is_in_group("PlayerScoop"):
		player_pos = area.position
		player_in = true

func _on_area_exited(area):
	if area.is_in_group("PlayerScoop"):
		player_in = false
