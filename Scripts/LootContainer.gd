extends NinePatchRect


func _ready() -> void:
	visible = false
	
	
func collect_loot() -> void:
	visible = true
	$VBoxContainer/LootList.add_icon_item(load(Global.briefcase_sprite), false)
