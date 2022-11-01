extends "res://Scripts/Door.gd"


# var
var combination: Array = [4, 1, 5];


func _input_event(viewport: Object, event: InputEvent, shape_idx: int) -> void:
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		$CanvasLayer/NumberPad.popup_centered();


func _on_Door_body_exited(body: Node) -> void:
	if body == Global.Player:
		can_click = false;
		$CanvasLayer/NumberPad.hide();
		$CanvasLayer/NumberPad.reset_lock();


func _on_NumberPad_combination_correct() -> void:
	open();


func _on_Computer_combination(numbers, lock_group) -> void:
	combination = numbers;
	$CanvasLayer/NumberPad.combination = combination;
	$Label.rect_rotation = -rotation_degrees;
