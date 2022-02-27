extends Button

func _on_ResumeButton_pressed():
	get_node("..").visible = false
	get_tree().paused = false
