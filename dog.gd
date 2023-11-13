extends CharacterBody2D

var player
var speed = 110
var chase = false
var OriginPosition 
var SecondPosition
var direction = Vector2.ZERO

func _ready():
	player = get_node("../Node2D/Player")
	OriginPosition = $"../OriginPosition".position
	SecondPosition = $"../SecondPosition".position
	self.position = OriginPosition
	
	
func _process(delta):
	if chase and !player.is_hidden:
		chase_cat()
	else:
		patroll()
		
		
func chase_cat():
	direction = (player.position - self.position).normalized()
	velocity = direction * speed
	move_and_slide()

func patroll():
	if self.position != OriginPosition:
		await get_tree().create_timer(3.0).timeout
		direction = (OriginPosition - self.position).normalized()
		velocity = direction * speed
		move_and_slide()
	else:
		await get_tree().create_timer(3.0).timeout
		direction = (SecondPosition - self.position).normalized()
		velocity = direction * speed
		move_and_slide()
	

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		chase = true
		print("alert")


func _on_area_2d_body_exited(body):
	if body.name == "Player":
		chase = false
		patroll()
