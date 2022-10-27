extends Popup

# Onready
onready var display = $Background/VSplitContainer/DisplayContainer/Display;

# Vars
var combination: Array = [4, 1, 5];
var guess: Array = [];


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
	if guess == combination:
		$Timer.start();
	else:
		reset_lock();


func enter(button) -> void:
	guess.append(button);
	
	
func reset_lock() -> void:
	display.clear();
	guess.clear();
	

func update_display() -> void:
	display.bbcode_text = "[center]" + PoolStringArray(guess).join("") + "[/center]";
	
	if guess.size() == combination.size():
		check_guess();


func _on_Timer_timeout() -> void:
	print("Correct");
