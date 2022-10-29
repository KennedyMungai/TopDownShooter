extends Popup


func set_text(combination) -> void:
	$RichTextLabel.bbcode_text = ("Will you stop forgetting the access code? I've set it to " 
			+ PoolStringArray(combination).join("") + 
			", but this is the last time");
