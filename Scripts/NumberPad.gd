extends Popup


# Vars
var combination: Array = [4, 1, 5];


func _ready() -> void:
	connect_buttons();


func connect_buttons() -> void:
	for button in $Background/VSplitContainer/ButtonsContainer/ButtonGrid.get_children():
		if button is Button:
			button.connect("pressed", self, "_on_Button_Pressed", [button.text]);


func _on_Button_Pressed(button) -> void:
	if button == "Ok":
		check_guess();
	else:
		enter(int(button));


func check_guess() -> void:
	pass;
