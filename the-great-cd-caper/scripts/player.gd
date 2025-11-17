extends CharacterBody2D

@export var accel : int
@export var fall_velocity_factor : float = 3

signal talk_to_npc
signal play_cd

const MAX_SPEED = 200.0
const JUMP_VELOCITY = -400.0

var falling_through = false
var music_toggle = 0
var song1 = preload("res://assets/A Search.ogg")
var song2 = preload("res://assets/2025-11-11.mp3")

@onready var jump_buffer_timer: Timer = $Timer

func _ready() -> void:
	$Music.play()


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		talk_to_npc.emit()
		play_cd.emit()


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("reset_player_position"):
		set_collision_mask_value(3, false)
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if is_on_floor():
		set_collision_mask_value(3, true)

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and !Input.is_action_pressed("ui_down"):
		velocity.y = JUMP_VELOCITY
		set_collision_mask_value(3, false)
	
	# Drop Through Platform
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and Input.is_action_pressed("ui_down"):
		set_collision_mask_value(3, false)
		falling_through = true
		$DropthroughCancelTimer.start()
	
	if velocity.y > 0 and !Input.is_action_pressed("ui_down") and !falling_through:
		set_collision_mask_value(3, true)
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * MAX_SPEED, accel)
		if is_on_floor(): $AnimationPlayer.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, accel)
		if is_on_floor(): $AnimationPlayer.play("idle")

	move_and_slide()
	if direction == -1: $Sprite2D.flip_h = true
	elif direction == 1: $Sprite2D.flip_h = false
	
	if velocity.y == JUMP_VELOCITY: $AnimationPlayer.play("jump")
	if !$AnimationPlayer.is_playing() and velocity.y > 0: $AnimationPlayer.play("fall")
	if velocity.y > 0: $AnimationPlayer.play("fall")


func _on_area_2d_body_entered(body: Node2D) -> void:
	position = Vector2(147, 410)
	velocity.y = 0


func _on_dropthrough_cancel_timer_timeout() -> void:
	falling_through = false


func _on_music_finished() -> void:
	if music_toggle == 0:
		$Music.stream = song2
		music_toggle = 1 - music_toggle
	elif music_toggle == 1:
		$Music.stream = song1
		music_toggle = 1 - music_toggle
	
	$Music.play()
