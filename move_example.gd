func _physics_process(delta):
	move()
	
func _get_move_input():
	return Input.get_axis("move_backward", "move_forward")
	
		
func _get_move_speed():
	return 5.0

func move():
	var motion = (-transform.basis.z * _get_move_input()) * _get_move_speed()
	var snap = Vector3.DOWN
	if is_on_floor():
		motion = (motion - get_floor_normal() * motion.dot(get_floor_normal())).normalized() * motion.length();
		snap = get_floor_normal() 

	move_and_slide_with_snap(motion, Vector3.DOWN, Vector3.UP, true)
