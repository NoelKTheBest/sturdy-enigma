extends Node


# Dialog that the game will use to talk to the player
var event_dialog = []
# The current event the player is on
var event_inc : int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func progress_story(event_number: int):
	# set event_inc by event_number
	# call run_event(int)
	
	match event_number:
		1: return "Oh hey Anna, I didn't know you were back in town. How are you?"
		2: return "You lost that cd?"
		3: return "Mmmmm...I was kinda busy with something at the moment...but I can help you find it."
		4: return Vector2(0, 0) # return position that npc will be at in main scene
		5: return Vector2(0, 0) # return position that npc will be at in log cabin
		#6: ....
		# ...
		# ...


func run_event(event_number: int):
	# set event_text to event_dialog[event_number]
	pass

# Note:
#	The friend will simply appear on each new level of the game
#	The friend first must exit view before they reappear
#	Use Areas to detect when the player reaches the next level
#	 run a function that sets the new friend's position next to the house.
#	We only need to do this for when the player leaves the friends house
#	 when the player reaches the parent's house, the coworker's residence
#	 and finally when the player reaches the woods and then when they get back home.
#	 That's 5 times in total.
