extends CharacterBody2D

@export var wander_direction: Node2D
var chase_direction = Vector2.ZERO
@export var base_position: Marker2D
var chase = false
var cat
var speed = 100

func _physics_process(delta):
	patrol()
	if chase and !cat.is_hidden:
		chase_the_cat()
	else:
		velocity = (base_position.position - self.position) * (speed * 0.6)
		move_and_slide()
		patrol()

func patrol():
	velocity = wander_direction.direction * (speed * 0.6)
	move_and_slide()
	
func chase_the_cat():
	chase_direction = (cat.position - self.position).normalized()
	velocity = chase_direction* speed
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		cat = body
		chase = true
		print("chase")


func _on_area_2d_body_exited(body):
	if body.name == "Player":
		chase = false
		print("stop chase")
