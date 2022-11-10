extends Node2D


func _ready() -> void:
	update_pointer_position()


func _on_ObjectiveMove_body_entered(body: Node) -> void:
	update_pointer_position()


func _on_ObjectiveDoor_body_entered(body: Node) -> void:
	update_pointer_position()


func _on_ObjectiveNightVision_body_entered(body: Node) -> void:
	update_pointer_position()


func _on_ObjectiveLoot_body_entered(body: Node) -> void:
	update_pointer_position()


func _on_ObjectiveExit_body_entered(body: Node) -> void:
	update_pointer_position()


func update_pointer_position() -> void:	
	var pointer = $ObjectiveAreas
	var marker = $ObjectiveMarker.get_child(0)
	pointer.position = marker.position
	$ObjectiveMarker.remove_child(marker)
	$AudioStreamPlayer.play()
