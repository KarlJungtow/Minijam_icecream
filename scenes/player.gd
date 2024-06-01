extends CharacterBody2D


const SPEED = 600.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var coyote_time = 0.0
var late_jump_time = 0.0

var start_pos: Vector2

func _ready():
	start_pos = position

func _process(delta):
	coyote_time -= delta
	late_jump_time -= delta

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump"):
		late_jump_time = 0.1
	if is_on_floor():
		coyote_time = 0.1
	if late_jump_time >= 0.0 and coyote_time >= 0.0:
		late_jump_time = -1.0
		velocity.y = JUMP_VELOCITY
	
	
	
	var direction = Input.get_axis("move-left", "move-right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_player_detection_box_area_entered(area):
	if get_tree().get_nodes_in_group("KillZone").has(area):
		position = start_pos
