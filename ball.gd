extends CharacterBody2D


const SPEED = 50.0
var SPD_MOD = Vector2(0,0)
var direction = Vector2(5,5)
var rnd = RandomNumberGenerator.new()

func _ready():
	
	direction.x = rnd.randi_range(-10,10)
	direction.y = rnd.randi_range(-10,10)
	
	if direction.x >= 0 and direction.x < 4: direction.x += 3
	if direction.x <= 0 and direction.x > -4: direction.x -= 3
	
	if direction.y >= 0 and direction.y < 4: direction.y += 3
	if direction.y <= 0 and direction.y > -4: direction.y -= 3

func _physics_process(delta):
	
	#bounce off walls
	if is_on_wall() and direction.x > 0:
		direction.x = -direction.x
	elif is_on_wall() and direction.x < 0:
		direction.x = direction.x * -1
	
	#bounce of ceiling
	if is_on_floor() and direction.y > 0:
		direction.y = -direction.y
	elif is_on_ceiling() and direction.y < 0:
		direction.y = direction.y * -1
		
	if Input.is_action_just_pressed("ui_accept"):
		_reset()
	
	velocity.x = direction.x * SPEED
	velocity.y = direction.y * SPEED
	move_and_slide()

func _reset():
	#resetting the positions
	position.x = 512
	position.y = 384
	
	direction = Vector2(0,0) #resetting velocity
	await get_tree().create_timer(2.0).timeout
	
	#randomizing the angle
	rnd.randomize() 
	direction.x = rnd.randi_range(-10,10)
	rnd.randomize()
	direction.y = rnd.randi_range(-10,10)
	
	#checking if the direction/velocity is too small
	if direction.x >= 0 and direction.x < 4:  direction.x += 5
	if direction.x <= 0 and direction.x > -4: direction.x -= 5
		
	if direction.y >= 0 and direction.y < 4:  direction.y += 5
	if direction.y <= 0 and direction.y > -4: direction.y -= 5
