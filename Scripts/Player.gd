extends "res://Scripts/Character.gd";


# Variables
var motion = Vector2();


func _process(delta: float) -> void:
	update_motion(delta);
	move_and_slide(motion);


func update_motion(delta: float) -> void:
	pass;
