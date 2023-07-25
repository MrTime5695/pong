extends Node2D

@onready var p1lbl  = $"score counter/score1"
@onready var p2lbl  = $"score counter/score2"
@onready var winscr = $"score counter/winner"
@onready var btns   = $"score counter/Buttons"

var p2score = 0
var p1score = 0

func _on_player_1_goal_body_entered(body):
	if body.is_in_group("ball"):
		print("P2 scored")
		p2score += 1
		p2lbl.text = "P2 Score: " + var_to_str(p2score)
		$ball._reset()


func _on_player_2_goal_body_entered(body):
	if body.is_in_group("ball"):
		print("P1 scored")
		p1score += 1
		p1lbl.text = "P1 Score: " + var_to_str(p1score)
		$ball._reset()


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	
	if p1score == 3:
		$ball.get_tree().paused = true
		winscr.text = "Player One Wins!"
		winscr.visible = true
		btns.visible = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if p2score == 3:
		$ball.get_tree().paused = true
		winscr.text = "Player Two Wins!"
		winscr.visible = true
		btns.visible = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
