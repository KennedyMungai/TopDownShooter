extends "res://Scripts/PlayerDetection.gd"


# Variables
var motion: Vector2 = Vector2();
var possible_destinations: Array = [];
var path: Array = [];
var destination: Vector2 = Vector2();

# Export variables
export var walk_slowdown: float = 0.5;
export var navigation_stop_theshold = 5;

# Onready variables
onready var navigation = Global.navigation;
onready var available_destinations = Global.destinations;


func _ready() -> void:
	possible_destinations = available_destinations.get_children();
	make_path();
	
func _process(delta: float) -> void:
	navigate();
	
	
func make_path() -> void:
	randomize();
	var next_destination = possible_destinations[randi() % possible_destinations.size()];
	
	path = navigation.get_simple_path(global_position, next_destination.global_position, false);


func navigate() -> void:
	var distance_to_destination = position.distance_to(path[0]);
	destination = path[0];
	
	if(distance_to_destination > navigation_stop_theshold):
		move();
	else:
		update_path();
		

func move() -> void:
	look_at(destination);
	motion = (destination - position).normalized() * (MAX_SPEED * walk_slowdown); 
	
	if is_on_wall():
		make_path();
	
	move_and_slide(motion);
	

func update_path() -> void:
	if path.size() == 1:
		if $Timer.is_stopped():
			$Timer.start();
	else:
		path.remove(0);


func _on_Timer_timeout() -> void:
	make_path();
