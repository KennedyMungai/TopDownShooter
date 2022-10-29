extends Node


# Export vars
export var length: int = 4; 


func _ready() -> void:
	generator_combination(length);


func generator_combination(length: int) -> void:
	var combination: Array = [];
	
	for number in range():
		randomize();
		combination.append(randi() % 10);
		
	print(combination);
