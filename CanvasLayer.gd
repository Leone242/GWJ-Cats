extends CanvasLayer

@export var in_game_menu: Node


func _process(delta):
	if Input.is_action_just_pressed("escape"):
		$MenuGame.show()
