extends ItemList


func update_disguises(number: int) -> void:
	clear(); 
	
	for disguises in range(number):
		add_icon_item(load(Global.box_sprite), false)
