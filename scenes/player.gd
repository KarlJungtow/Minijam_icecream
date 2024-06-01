extends CharacterBody2D


const SPEED = 800.0
const JUMP_VELOCITY = -800.0

const flame_scene = preload("res://scenes/flame.tscn")

var gravity = 1.5*ProjectSettings.get_setting("physics/2d/default_gravity")

var using_flamethrower: bool = false

var coyote_time = 0.0
var late_jump_time = 0.0

var force_push = 1000


var attacking = false
var start_pos: Vector2
@onready var sprite_2d = $PlayerSprite

func _ready():
	start_pos = position
	get_flame_thrower()
	G.connect("player_died",Callable(self,"die"))


func get_flame_thrower():
	$FlameThrowerAnchor.show()
	using_flamethrower = true

func respawn():
	position = start_pos

func die():
	$dying_sounds.play()
	var tween = get_tree().create_tween()
	tween.tween_interval(1.0)
	tween.tween_callback(respawn)

func _process(delta):
	coyote_time -= delta
	late_jump_time -= delta

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_pressed("attack"):
		attack()

	if $PlayerSprite.is_playing() == false:
		attacking = false
	if Input.is_action_just_pressed("jump"):
		$jumps_sounds.play()
		late_jump_time = 0.1
	if is_on_floor():
		coyote_time = 0.1
	if late_jump_time >= 0.0 and coyote_time >= 0.0:
		late_jump_time = -1.0
		velocity.y = JUMP_VELOCITY
	
	var direction = Input.get_axis("move-left", "move-right")
	if direction > 0: 
		sprite_2d.scale.x = -1
	elif direction < 0:
		sprite_2d.scale.x = 1
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var collided = move_and_slide()
	
	#apply force to collided stuff
	if collided:
		for i in get_slide_collision_count():
			var col = get_slide_collision(i)
			if col.get_collider() is RigidBody2D:
				col.get_collider().apply_force(col.get_normal() * -force_push)
	
	
	if abs(velocity.x) >= 0.01 and coyote_time >= 0.0:
		if $PlayerSprite.is_playing() == false :
			$PlayerSprite.play("walk")
	elif not attacking:
			$PlayerSprite.stop()
	
	move_and_slide()

func _input(event):
	if event is InputEventMouseMotion:
		if using_flamethrower:
			$FlameThrowerAnchor.look_at(get_global_mouse_position())
	if event.is_action_pressed("click"):
		if using_flamethrower:
			
			var instance = flame_scene.instantiate()
			instance.global_position = $FlameThrowerAnchor/Flamethrower.global_position
			instance.rotation = $FlameThrowerAnchor.rotation
			$FlameThrowerAnchor/Flames.add_child(instance)
			
			move_and_slide()

			
func _on_player_detection_box_area_entered(area):
	if get_tree().get_nodes_in_group("CheckPoint").has(area):
		start_pos = area.position


func attack():
	print("Attack")
	$PlayerSprite.play("spoon_attack")
	attacking = true
	var enemies = $"../enemies".get_children()
	if enemies != null:
		for child in enemies:
			if abs(child.position.x - position.x) < 125 and abs(child.position.y - position.y) < 80:
				child.queue_free()
		

