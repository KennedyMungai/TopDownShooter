extends Area2D


var can_click: bool = false;
var combination: Array;


func _ready() -> void:
	$Light2D.enabled = false;


func _on_Computer_body_entered(body: Node) -> void:
	can_click = true;


func _on_Computer_body_exited(body: Node) -> void:
	can_click = false;
