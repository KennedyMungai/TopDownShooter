extends Area2D



func _on_Briefcase_body_entered(body: Node) -> void:
	Global.Player.collect_briefcase()
