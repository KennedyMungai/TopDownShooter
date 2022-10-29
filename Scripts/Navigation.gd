extends Navigation2D


var can_click: bool = false;
var combination: Array;


func _ready() -> void:
	Global.navigation = self;
