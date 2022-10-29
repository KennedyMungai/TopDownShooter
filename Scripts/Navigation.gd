extends Navigation2D


var can_click: bool = false;


func _ready() -> void:
	Global.navigation = self;
