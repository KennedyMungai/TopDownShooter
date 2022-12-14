extends "res://Scripts/Character.gd";


# Variables
var motion = Vector2();
var vision_change_on_cooldown: bool = false;
var disguised: bool = false;
var velocity_multiplier: float = 1.0;

# Enums
enum vision_mode {DARK, NIGHTVISION};


# Export Vars
export var disguises: int = 3;
export var disguise_duration: int = 5;
export var disguise_slowdown:float = 0.25;


func _ready() -> void:
	Global.Player = self;
	vision_mode.DARK;
	collision_layer = 16;
	$Timer.wait_time = disguise_duration;
	reveal();
	update_disguise_displayer()


func _process(delta: float) -> void:
	update_motion(delta);
	move_and_slide(motion);
	if disguised:
		$Label.text = str($Timer.time_left).pad_decimals(2);
		$Label.rect_rotation = -rotation_degrees;


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


func _input(event: InputEvent) -> void:
	if(Input.is_action_pressed("ui_vision_mode_change") and not vision_change_on_cooldown):
		cycle_vision_mode();
		vision_change_on_cooldown = true;
		$VisionModeTimer.start();
	
	if Input.is_action_just_pressed("toggle_disguise"):
		toggle_disguise();


func cycle_vision_mode() -> void:
	if vision_mode is vision_mode.DARK:
		get_tree().call_group("interface", "NightVision");
		vision_mode.NIGHTVISION;
	elif vision_mode is vision_mode.NIGHTVISION:
		get_tree().call_group("interface", "DarkVision");
		vision_mode.DARK;
		

func _on_VisionModeTimer_timeout() -> void:
	vision_change_on_cooldown = false;


func disguise() -> void:
	$Label.visible = true;
	$Sprite.texture = load(Global.box_sprite);
	$Light2D.texture = load(Global.box_sprite);
	disguised = true;
	
	disguises -= 1
	update_disguise_displayer()
	
	velocity_multiplier = disguise_slowdown;
	$Timer.start();
	
	
func reveal() -> void:
	$Label.visible = false;
	$Sprite.texture = load(Global.player_sprite);
	$Light2D.texture = load(Global.player_sprite);
	disguised = false;
	velocity_multiplier = 1;
	
	
func toggle_disguise() -> void:
	if disguised:
		reveal();
	elif disguises > 0:
		disguise();
		
		
func update_disguise_displayer() -> void:
	get_tree().call_group("DisguiseDisplay", "update_disguises", disguises)
	

func collect_briefcase() -> void:
	var loot = Node.new()
	loot.set_name("briefcase")
	add_child(loot)
	get_tree().call_group("interface", "collect_loot")
