extends Node2D

@export var dog_group: String

var positions: Array
var tmp_positions: Array
var current_position: Marker2D
var direction = Vector2.ZERO

func _ready():
	positions = get_tree().get_nodes_in_group(dog_group)
	get_positions()
	get_next_position()
	
func _physics_process(delta):
	if global_position.distance_to(current_position.position) < 10:
		get_next_position()


func get_positions():
	tmp_positions = positions.duplicate()
	tmp_positions.shuffle()
	
func get_next_position():
	if tmp_positions.is_empty():
		get_positions()
	current_position = tmp_positions.pop_front()
	direction = to_local(current_position.position).normalized()
	
