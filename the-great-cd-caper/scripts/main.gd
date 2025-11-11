extends Node2D

signal _04_player_finds_friend()
signal _05_friend_helps_player()


var player_can_enter
var current_house
var houses

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SceneLoader.scene_00_instance = get_tree().root.get_node("Node2D")
	houses = get_tree().get_nodes_in_group("House")
	for house in houses:
		house.connect("player_can_enter", player_can_enter_house)
		house.connect("player_cannot_enter", player_cannot_enter_house)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	#$Camera2D.position.x = $CharacterBody2D.position.x
	$Camera2D.position = $CharacterBody2D.position
	
	if player_can_enter:
		if Input.is_action_just_pressed("enter_house"):
			match current_house:
				"Log Cabin": SceneLoader.change_scenes(0, 1)
				"Friend's House": SceneLoader.change_scenes(0, 2)
				"Parent's of Friend": SceneLoader.change_scenes(0, 3)
	
	if false:
		SceneLoader.change_scenes(0, 4)


func _on_item_player_can_interact() -> void:
	#print_rich("[color=blue]Press E to interact")
	print("Press E to interact")


func player_can_enter_house(house_name: String):
	player_can_enter = true
	current_house = house_name


func player_cannot_enter_house():
	player_can_enter = false
	current_house = null
