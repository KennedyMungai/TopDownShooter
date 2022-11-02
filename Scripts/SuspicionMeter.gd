extends TextureProgress


#Vars
var suspicion: int = 0;

#Export Vars
export var suspicion_step: int = 1;
export var suspicion_dropoff: float = 0.25;


func _process(delta: float) -> void:
	suspicion -= suspicion_dropoff;
	value = suspicion;


func player_scene() -> void:
	suspicion += suspicion_step;
