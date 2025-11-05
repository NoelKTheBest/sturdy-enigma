extends Sprite2D

## Name of the house
@export var house_name : String = ""

## Player can enter house by name
signal player_can_enter(house_name : String)
signal player_cannot_enter

var signal_was_sent = false
var second_signal_was_sent = false

func _process(delta: float) -> void:
	if $PlayerDetection.has_overlapping_bodies() and !signal_was_sent:
		#print($PlayerDetection.get_overlapping_bodies())
		player_can_enter.emit(house_name)
		signal_was_sent = true
	
	if !$PlayerDetection.has_overlapping_bodies() and !second_signal_was_sent:
		player_cannot_enter.emit()
		second_signal_was_sent = true


func _on_player_detection_body_entered(body: Node2D) -> void:
	$Control/Label.visible = true
	second_signal_was_sent = false


func _on_player_detection_body_exited(body: Node2D) -> void:
	$Control/Label.visible = false
	signal_was_sent = false
