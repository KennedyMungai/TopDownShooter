extends CanvasModulate


const DARK = Color("18147a");
const NIGHTVISION = Color("35b088");

func _ready() -> void:
	add_to_group("interface");
	color = DARK;
	

func NightVision() -> void:
	inform_npcs("NightVision");
	color = NIGHTVISION;
	$AudioStreamPlayer2D.stream = load(Global.nightvision_on_sfx);
	play_sfx();
	
func DarkVision() -> void:
	inform_npcs("DarkVision");
	color = DARK;
	$AudioStreamPlayer2D.stream = load(Global.nightvision_off_sfx);
	play_sfx();


func play_sfx() -> void:
	$AudioStreamPlayer2D.play();


func inform_npcs(vision_mode) -> void:
	get_tree().call_group("NPC", vision_mode);
