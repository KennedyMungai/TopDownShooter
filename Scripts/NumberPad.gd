extends Popup


func connect_buttons() -> void:
	for button in $Background/VSplitContainer/ButtonsContainer/ButtonGrid.get_children():
		button.connect("pressed", self, "_on_Button_Pressed", [button.text]);
