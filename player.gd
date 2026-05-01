extends CharacterBody2D


const SPEED = 400
const JUMP_VELOCITY = -800


var gravitydir = 1
var dashgravity = 1


func _physics_process(delta: float) -> void:
	if dashgravity == 1:
		if not is_on_floor() and gravitydir == 1:
			velocity += get_gravity() * delta * 2 * gravitydir
		if not is_on_ceiling() and gravitydir == -1:
			velocity += get_gravity() * delta * 2 * gravitydir
		if Input.is_action_just_pressed("ui_accept") and is_on_floor() and gravitydir == 1:
			velocity.y = JUMP_VELOCITY
			
		if Input.is_action_just_pressed("ui_accept") and is_on_ceiling() and gravitydir == -1:
			velocity.y = -JUMP_VELOCITY
		
		var direction = Input.get_axis("ui_left", "ui_right")
		
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		move_and_slide()
		
		if Input.is_action_just_pressed("gravity"):
			gravitydir = -gravitydir
		
	if Input.is_action_just_pressed("dash"):
		dashgravity = 0
		$"Dash gravity timer".start()
		var directionx = Input.get_axis("ui_left", "ui_right")
		var directiony = Input.get_axis("ui_up", "ui_down")
		var count = 4
		while count != 0:
			if directionx and directiony:
				move_and_collide(Vector2(directionx*55/sqrt(2), directiony*55/sqrt(2)))
			else:
				move_and_collide(Vector2(directionx* 55, directiony * 55))
			count = count - 1

func _on_dash_gravity_timer_timeout():
	dashgravity = 1
