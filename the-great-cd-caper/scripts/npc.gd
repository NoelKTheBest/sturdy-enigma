extends Sprite2D

var player_can_interact
@export var idle_anim : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play(idle_anim)
	$Label.visible = false
	$Label2.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !player_can_interact:
		$Label.visible = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	player_can_interact = true
	$Label2.visible = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	player_can_interact = false
	$Label2.visible = false


func _on_character_body_2d_talk_to_npc() -> void:
	if player_can_interact:
		$Label.visible = true
		$Label2.visible = false
