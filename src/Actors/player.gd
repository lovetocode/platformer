extends Actor

func _physics_process(delta):
	var direction = get_direction()
	velocity1 = calculate_move_velocity(velocity,direction,speed,delta)
	set_velocity(velocity1)
	move_and_slide()
	
func get_direction():
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0
	  ) 
	
func calculate_move_velocity(linear_velocity,
							  direction,
							 speed,
							  delta):
	var new_velocity = linear_velocity
	new_velocity = speed.x * direction.x
	velocity.y += gravity * delta
	if direction.y == -1.0:
		velocity.y = speed.y * direction.y
	return Vector2(new_velocity, velocity.y)

