extends Node2D



func _on_play_pressed():
	get_tree().change_scene_to_file("res://world.tscn")


func _on_options_pressed():
	get_node("OptionPanel").show()


func _on_quit_pressed():
	pass # Replace with function body.


func _on_exit_options_pressed():
	get_node("OptionPanel").hide()
