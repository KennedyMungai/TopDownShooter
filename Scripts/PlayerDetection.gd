extends "res://Scripts/Character.gd"


#Constants
const FOV_TOLERANCE = 20;
const MAX_DETECTION_RANGE = 320;
const white = Color.white;
const red = Color.red;

#Onready Variables
onready var Player = Global.Player;


func _ready() -> void:
	add_to_group("NPC");


func _process(delta: float) -> void:
	if(Player_is_in_FOV_TOLERANCE()):
		$Torch.color = red;
		get_tree().call_group("SuspicionMeter", "player_seen");
	else: 
		$Torch.color = white;
	
	
func Player_is_in_FOV_TOLERANCE() -> bool:
	var NPC_facing_direction = Vector2(1, 0).rotated(global_rotation);
	var direction_to_Player = (Player.position - global_position).normalized();

	if(abs(direction_to_Player.angle_to(NPC_facing_direction)) < deg2rad(FOV_TOLERANCE) and Player_is_in_LOS()):
		return true;
	else:
		return false;


func Player_is_in_LOS() -> bool:
	var space = get_world_2d().direct_space_state;
	var LOS_obstacle = space.intersect_ray(global_position, Player.global_position, [self], collision_mask);

	var distance_to_player = Player.global_position.distance_to(global_position);
	var Player_in_range = distance_to_player < MAX_DETECTION_RANGE;

	if(LOS_obstacle.collider == Player and Player_in_range):
		return true;
	else:
		return false;


func NightVision() -> void:
	$Torch.enabled = false;
	
	
func DarkVision() -> void:
	$Torch.enabled = true;
