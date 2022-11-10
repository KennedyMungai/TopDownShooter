extends Node2D


var text: String


func _ready() -> void:
	update_pointer_position(0)
	$TutorialGUI/Popup.show()
	text = get_json()
	

func _on_ObjectiveMove_body_entered(body: Node) -> void:
	update_pointer_position(1)


func _on_ObjectiveDoor_body_entered(body: Node) -> void:
	update_pointer_position(2)


func _on_ObjectiveNightVision_body_entered(body: Node) -> void:
	update_pointer_position(3)


func _on_ObjectiveLoot_body_entered(body: Node) -> void:
	update_pointer_position(4)


func _on_ObjectiveExit_body_entered(body: Node) -> void:
	update_pointer_position(5)


func update_pointer_position(number: int) -> void:	
	var pointer = $ObjectiveAreas
	var marker = $ObjectiveMarker.get_child(number)
	pointer.position = marker.position
	$AudioStreamPlayer.play()
	$Tween.interpolate_property(pointer, "position", pointer.position, marker.position, 0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$Tween.start()


func get_json() -> String:
	var file = File.new()
	file.open(Global.tutorial_messages, File.READ)
	var content = file.get_as_text()
	file.close()
	return parse_json(content)


