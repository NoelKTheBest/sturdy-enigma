extends Node2D

signal end_game
var player_can_interact

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D/AnimationPlayer.play("float")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_can_interact = true
		$Label.visible = true


func _on_character_body_2d_play_cd() -> void:
	if player_can_interact:
		end_game.emit()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_can_interact = false
		$Label.visible = false
