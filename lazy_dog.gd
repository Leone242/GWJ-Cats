extends CharacterBody2D


var player
var speed = 110
var chase = false
var direction = Vector2.ZERO

func _ready():
	player = get_node("../Node2D/Player")

func _physics_process(delta):
	if chase and !player.is_hidden:
		direction = (player.position - self.position).normalized()
		velocity = direction * speed
		move_and_slide()
	elif self.position.distance_to(get_node("../Marker2D4").position) > 5:
		await get_tree().create_timer(1.0).timeout
		direction = (get_node("../Marker2D4").position - self.position).normalized()
		velocity = direction * speed
		move_and_slide()		

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		chase = true
		print("alert")


func _on_area_2d_body_exited(body):
	if body.name == "Player":
		chase = false
