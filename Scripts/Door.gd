extends Area2D


# Vars
var can_click: bool = false


func _on_Door_body_entered(body: Node) -> void:
	if not body == Global.Player and not $AnimationPlayer.is_playing():
		open();
	else:
		can_click = true;


func _on_Door_body_exited(body: Node) -> void:
	if body == Global.Player:
		can_click = false;


func open() -> void:
	$AnimationPlayer.play("Open");


func _input_event(viewport: Object, event: InputEvent, shape_idx: int) -> void:
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		open();
