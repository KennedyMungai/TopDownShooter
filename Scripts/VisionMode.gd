extends CanvasModulate


const DARK = Color("18147a");
const NIGHTVISION = Color("35b088");

func _ready() -> void:
	add_to_group("interface");
	color = DARK;
	

func NightVision() -> void:
	color = NIGHTVISION;
	$AudioStreamPlayer2D.stream(Global.nightvision_on_sfx);
	
	
func DarkVision() -> void:
	color = DARK;
	$AudioStreamPlayer2D.stream(Global.nightvision_off_sfx);
