extends Node2D
class_name PathFinding


@onready var nav_agent = $NavigationAgent2D
@onready var cat : CharacterBody2D = owner.get_parent().find_child("Player")
var direction = Vector2.ZERO

func _ready():
	pass
	
func find_the_cat():
	nav_agent.target_position = cat.position

func _on_timer_timeout():
	find_the_cat()
	direction = to_local(nav_agent.get_next_path_position()).normalized()
