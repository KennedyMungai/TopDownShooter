extends Area2D


var can_click: bool = false;
var combination: Array;


func _ready() -> void:
	$Light2D.enabled = false;


func _on_Computer_body_entered(body: Node) -> void:
	can_click = true;
	$Light2D.enabled = true;


func _on_Computer_body_exited(body: Node) -> void:
	can_click = false;
	$Light2D.enabled = false;
	
	
func _input_event(viewport: Object, event: InputEvent, shape_idx: int) -> void:
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		$CanvasLayer/ComputerPopup.popup_centered();
