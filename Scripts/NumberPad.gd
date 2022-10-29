extends Popup

# Onready
onready var display = $Background/VSplitContainer/DisplayContainer/Display;
onready var light = $Background/VSplitContainer/ButtonsContainer/ButtonGrid/Light;

# Vars
var combination: Array = [4, 1, 5];
var guess: Array = [];
var two_tone = load("res://SFX/twoTone1.ogg");
var three_tone = load("res://SFX/threeTone1.ogg");


#Signals
signal combination_correct;


func _ready() -> void:
	connect_buttons();
	reset_lock();


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
		play_audio_cues(three_tone);
		light.texture = load(Global.green_light);
		$Timer.start();
	else:
		reset_lock();


func enter(button) -> void:
	play_audio_cues(two_tone);
	guess.append(button);
	update_display();
	
	
func reset_lock() -> void:
	light = load(Global.red_light);
	display.clear();
	guess.clear();
	

func update_display() -> void:
	display.bbcode_text = "[center]" + PoolStringArray(guess).join("") + "[/center]";
	
	if guess.size() == combination.size():
		check_guess();


func _on_Timer_timeout() -> void:
	emit_signal("combination_correct");
	hide();
	reset_lock();
	

func play_audio_cues(sound_clip) -> void:
	$AudioStreamPlayer2D.stream = sound_clip;
	$AudioStreamPlayer2D.play();
