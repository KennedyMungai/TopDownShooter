extends TextureProgress


#Vars
var suspicion: int = 0;

#Export Vars
export var suspicion_step: int = 1;
export var suspicion_dropoff: float = 0.25;


func player_scene() -> void:
	suspicion += suspicion_step;
	value = suspicion;
