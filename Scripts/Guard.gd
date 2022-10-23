extends "res://Scripts/PlayerDetection.gd"


# Variables
var motion: Vector2 = Vector2();
var possible_destination: Array = [];
var path: Array = [];
var destination: Vector2 = Vector2();

# Export variables
export var walk_slowdown: float = 0.5;

# Onready variables
onready var navigation = Global.navigation;
