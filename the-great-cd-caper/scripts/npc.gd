extends Sprite2D

var player_can_interact


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	player_can_interact = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	player_can_interact = false
