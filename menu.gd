extends Node2D



func _on_play_pressed():
	$Btn2.play()
	get_tree().change_scene_to_file("res://world.tscn")


func _on_options_pressed():
	$Btn2.play()
	get_node("OptionPanel").show()

func _on_quit_pressed():
	$Btn2.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()
	

func _on_exit_options_pressed():
	$Btn2.play()
	get_node("OptionPanel").hide()


func _on_play_mouse_entered():
	$Btn1.play()


func _on_options_mouse_entered():
	$Btn1.play()


func _on_quit_mouse_entered():
	$Btn1.play()


func _on_exit_options_mouse_entered():
	$Btn1.play()
