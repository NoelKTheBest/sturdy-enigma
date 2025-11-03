extends Sprite2D

signal player_can_enter

var signal_was_sent = false

func _process(delta: float) -> void:
	if $PlayerDetection.has_overlapping_bodies() and !signal_was_sent:
		#print($PlayerDetection.get_overlapping_bodies())
		player_can_enter.emit()
		signal_was_sent = true


func _on_player_detection_body_entered(body: Node2D) -> void:
	$Control/Label.visible = true


func _on_player_detection_body_exited(body: Node2D) -> void:
	$Control/Label.visible = false
	signal_was_sent = false
