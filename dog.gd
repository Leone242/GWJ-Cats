extends CharacterBody2D

var player
var speed = 110
var chase = false
var direction = Vector2.ZERO
var path

func _ready():
	player = get_node("../../../Node2D/Player")
	path = get_node("..")
	
	
func _physics_process(delta):
	patroll(delta)
	if chase and !player.is_hidden:
		chase_cat()
			
		
func chase_cat():
	direction = (player.position - self.position).normalized()
	velocity = direction * speed
	move_and_slide()

func patroll(delta):
	path.progress += (speed * 0.6) * delta
	move_and_slide()
	

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		chase = true
		print("alert")


func _on_area_2d_body_exited(body):
	if body.name == "Player":
		chase = false

