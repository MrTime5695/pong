extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var mouse_sensitivity = 12

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		velocity.y = event.relative.y * mouse_sensitivity

func _physics_process(delta):
	velocity.x = 0
	position.x = 120
	move_and_slide()
