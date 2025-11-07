extends Node2D

signal _01_player_entered_house()
signal _02_player_found_notebook()
signal _03_player_finds_letter()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $Area2D.has_overlapping_bodies() and Input.is_action_just_pressed("return_to_main"):
		SceneLoader.change_scenes(1, 0)
	
	$Camera2D.position.x = $CharacterBody2D.position.x
