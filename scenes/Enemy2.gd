extends CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var run_speed = 350
var jump_speed = -1000
var gravity = 2500


func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_select')

	if is_on_floor() and jump:
		velocity.y = jump_speed
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed
	
	
func _physics_process(delta):
	get_input()
	#var collision_info = move_and_collide(velocity * delta)
	#if collision_info:
		#velocity = velocity.bounce(collision_info.get_normal())
