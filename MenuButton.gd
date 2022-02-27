extends Button

func _on_MenuButton_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Main.tscn")
