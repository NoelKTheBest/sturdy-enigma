extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if is_on_floor(): $AnimationPlayer.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor(): $AnimationPlayer.play("idle")

	move_and_slide()
	if direction == -1: $Sprite2D.flip_h = true
	elif direction == 1: $Sprite2D.flip_h = false
	
	if velocity.y == JUMP_VELOCITY: $AnimationPlayer.play("jump")


func _on_area_2d_body_entered(body: Node2D) -> void:
	position = Vector2(147, 410)
	velocity.y = 0
