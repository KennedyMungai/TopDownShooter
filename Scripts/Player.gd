extends "res://Scripts/Character.gd";


# Variables
var motion = Vector2();


func _ready() -> void:
	Global.Player = self;


func _process(delta: float) -> void:
	update_motion(delta);
	move_and_slide(motion);


func update_motion(delta: float) -> void:
	look_at(get_global_mouse_position());
	
#	Vertical Motion
	if(Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down")):
		motion.y = clamp((motion.y - SPEED), -MAX_SPEED, 0);
	elif(Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up")):
		motion.y = clamp((motion.y + SPEED),0 ,MAX_SPEED);
	else:
		motion.y = lerp(motion.y, 0, FRICTION);
		
#	Horizontal Motion
	if(Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right")):
		motion.x = clamp((motion.x - SPEED), -MAX_SPEED, 0);
	elif(Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left")):
		motion.x = clamp((motion.x + SPEED),0 ,MAX_SPEED);
	else:
		motion.x = lerp(motion.x, 0, FRICTION);
