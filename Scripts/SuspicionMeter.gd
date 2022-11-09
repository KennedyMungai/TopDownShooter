extends TextureProgress


#Vars
var suspicion: int = 0;

#Export Vars
export var suspicion_step: int = 1;
export var suspicion_dropoff: float = 0.25;


func _process(delta: float) -> void:
	suspicion -= suspicion_dropoff;
	clamp(suspicion, 0, max_value);
	value = suspicion;


func player_scene() -> void:
	suspicion += suspicion_step;
	
	if suspicion == max_value:
		end_game();


func end_game() -> void:
	get_tree().change_scene("res://Scenes/GameOverScreen.tscn")
