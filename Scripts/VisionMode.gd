extends CanvasModulate


const DARK = Color("18147a");
const NIGHTVISION = Color("35b088");

func _ready() -> void:
	add_to_group("interface");
	color = DARK;
	

func NightVision() -> void:
	$Timer.start();
	color = NIGHTVISION;
	
	
func DarkVision() -> void:
	color = DARK;
