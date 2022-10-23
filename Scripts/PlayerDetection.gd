extends "res://Scripts/Character.gd"


#Constants
const FOV_TOLERANCE = 22;

#Onready Variables
onready var Player = get_node("/root/Level1/Character");


func _process(delta: float) -> void:
	Player_is_in_FOV_TOLERANCE();
	
	
func Player_is_in_FOV_TOLERANCE() -> void:
	var NPC_facing_direction = Vector2(1, 0).rotated(global_rotation);
	var direction_to_Player = (Player.position - global_position).normalized();

	if(abs(direction_to_Player.angle_to(NPC_facing_direction)) < deg2rad(FOV_TOLERANCE)):
		print("FHello);
