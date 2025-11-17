extends Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	#$Camera2D.position.x = $CharacterBody2D.position.x
	$Camera2D.position = $CharacterBody2D.position


func _on_cd_end_game() -> void:
	$CanvasLayer/ColorRect.visible = true
	$AnimationPlayer.play("fade to white")
	$CharacterBody2D/Music.stop()
	$CharacterBody2D/AudioStreamPlayer2D.play()


func _on_audio_stream_player_2d_finished() -> void:
	get_tree().quit()
