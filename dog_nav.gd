extends CharacterBody2D


@export var path: PathFinding


func _physics_process(delta):
	velocity = path.direction * 100
	move_and_slide()
