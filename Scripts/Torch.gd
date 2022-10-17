extends Light2D


var torch_on: bool = true;


func _input(event: InputEvent) -> void:
	if(Input.is_action_just_pressed("torch_toggle")):
		torch_on = !torch_on;
		
	$".".enabled = torch_on;
