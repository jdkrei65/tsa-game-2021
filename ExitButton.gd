extends Button

func _on_ExitButton_pressed():
	get_node("..").visible = false
	get_tree().quit()
