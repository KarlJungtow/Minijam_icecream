extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass


var thrust = Vector2(0, -2500)
var torque = 20000

func _integrate_forces(state):
	if Input.is_action_pressed("ui_up"):
		#state.apply_force(thrust.rotated(rotation))
		state.apply_force(Vector2(2500, 0))
		
	else:
		state.apply_force(Vector2(-500, 0))
		
	var rotation_direction = 0
	if Input.is_action_pressed("ui_right"):
		rotation_direction += 1
	if Input.is_action_pressed("ui_left"):
		rotation_direction -= 1
	#state.apply_torque(rotation_direction * torque)


	rotation = 0
		
