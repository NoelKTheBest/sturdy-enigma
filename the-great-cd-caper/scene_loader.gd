extends Node

var scene_00 : PackedScene = preload("res://scenes/Scene Sequence/00_Main.tscn")
var scene_01 : PackedScene = preload("res://scenes/Scene Sequence/01_log_cabin_interior.tscn")
var scene_02 : PackedScene = preload("res://scenes/Scene Sequence/02_friend's_house.tscn")

var scene_00_instance
var scene_01_instance
var scene_02_instance

# Developing the full project, we want to have another scene that start and then create instances of the scene sequence
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#scene_00_instance = scene_00.instantiate()
	scene_01_instance = scene_01.instantiate()
	scene_02_instance = scene_02.instantiate()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func change_scenes(from_index: int, to_index : int):
	var from_scene
	var to_scene
	
	match from_index:
		0: from_scene = scene_00_instance
		1: from_scene = scene_01_instance
		2: from_scene = scene_02_instance
		
	match to_index:
		0: to_scene = scene_00_instance
		1: to_scene = scene_01_instance
		2: to_scene = scene_02_instance
	
	var root = get_tree().root
	# Remove current level
	root.remove_child(from_scene)
	
	# Add the next level
	root.add_child(to_scene)
