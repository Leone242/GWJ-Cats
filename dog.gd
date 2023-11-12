extends CharacterBody2D

var player
var speed = 150
var chase = false

func _ready():
	player = get_node("../Node2D/Player")

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		chase = true
		print("alert")
