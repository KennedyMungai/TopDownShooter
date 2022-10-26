extends Area2D


# Vars
var can_click: bool = false


func _on_Door_body_entered(body: Node) -> void:
	if body == Global.Player and not $AnimationPlayer.is_playing():
		open();
	else:
		can_click = true;


func _on_Door_body_exited(body: Node) -> void:
	pass # Replace with function body.


func open() -> void:
	$AnimationPlayer.play("Open");
