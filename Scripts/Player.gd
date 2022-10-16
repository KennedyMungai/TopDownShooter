extends "res://Scripts/Character.gd";


# Variables
var motion = Vector2();


func _process(delta: float) -> void:
	update_motion(delta);
	move_and_slide(motion);


func update_motion(delta: float) -> void:
	if(Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down")):
		motion.y = clamp((motion.y - SPEED), -MAX_SPEED, 0);
	if(Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up")):
		motion.y = clamp((motion.y + SPEED),0 ,MAX_SPEED);
