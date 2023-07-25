extends CharacterBody2D

func _unhandled_input(event):
	if Input.is_action_pressed("p1_up"):
		velocity.y = -170
	
	if Input.is_action_pressed("p1_down"):
		velocity.y = 170
func _physics_process(delta):
	if velocity.y > 0:velocity.y -=5
	if velocity.y < 0:velocity.y +=5
	velocity.x = 0
	position.x = 120
	move_and_slide()

