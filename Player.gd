extends CharacterBody2D

@export var speed: int = 150

@onready var anim_tree:= $AnimationTree

func _physics_process(delta):
	var input_vector = Vector2.ZERO

	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	if input_vector == Vector2.ZERO:
		anim_tree.get("parameters/playback").travel("Idle")
		show_animation("idle")
	else:
		anim_tree.get("parameters/playback").travel("Walk")
		anim_tree.set("parameters/Idle/blend_position", input_vector)
		anim_tree.set("parameters/Walk/blend_position", input_vector)
		show_animation("walk")
		input_vector = input_vector.normalized()
		position += input_vector * speed * delta
		move_and_slide()

func show_animation(anim_sprite):
	get_node("idle").hide()
	get_node("walk").hide()
	match anim_sprite:
		"idle": get_node("idle").show()
		"walk": get_node("walk").show()
		
