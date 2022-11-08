extends ColorRect




func _on_Area2D_body_entered(body: Node) -> void:
	if body.has_node("briefcase"):
		print("You have a briefcase")
