extends Node2D


func _ready() -> void:
	update_pointer_position()


func _on_ObjectiveMove_body_entered(body: Node) -> void:
	pass # Replace with function body.


func _on_ObjectiveDoor_body_entered(body: Node) -> void:
	pass # Replace with function body.


func _on_ObjectiveNightVision_body_entered(body: Node) -> void:
	pass # Replace with function body.


func _on_ObjectiveLoot_body_entered(body: Node) -> void:
	pass # Replace with function body.


func _on_ObjectiveExit_body_entered(body: Node) -> void:
	pass # Replace with function body.


func update_pointer_position() -> void:	
	var pointer = $ObjectiveAreas
	var marker = $ObjectiveMarker
