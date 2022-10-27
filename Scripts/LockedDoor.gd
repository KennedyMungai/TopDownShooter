extends "res://Scripts/Door.gd"


func _input_event(viewport: Object, event: InputEvent, shape_idx: int) -> void:
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		$NumberPad.popup_centered();
