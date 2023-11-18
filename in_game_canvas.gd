extends CanvasLayer


func _on_resume_pressed():
	self.hide()


func _on_options_pressed():
	$OptionPanel.show()


func _on_quit_to_menu_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_exit_game_pressed():
	get_tree().quit()
