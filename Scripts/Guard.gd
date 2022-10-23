extends "res://Scripts/PlayerDetection.gd"


# Variables
var motion: Vector2 = Vector2();
var possible_destinations: Array = [];
var path: Array = [];
var destination: Vector2 = Vector2();

# Export variables
export var walk_slowdown: float = 0.5;

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
	
	path = navigation.get_simple_path(global_position, next_destination.global_position, true);


func navigate() -> void:
	var distance_to_destination = position.distance_to(path[0]);
