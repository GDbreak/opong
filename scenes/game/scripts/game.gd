class_name Game
extends Node
## The parent node of all others during gameplay. The scene in which O-Pong takes place.

@onready var control = $Control
@onready var ball : Ball = $Control/Ball
@onready var goal : Goal = $Control/Goal
@onready var volley_label : VolleyLabel = $VolleyLabel
@onready var left_score_label = $LeftPanelVbox/ScoreLabel

func _ready():
	_connect_signals()
	
func _connect_signals():
	ball.volleyed.connect(_on_ball_volleyed)
	goal.goal_scored.connect(_on_goal_scored)
	
func _on_ball_volleyed(volleys : int, body : Paddle):
	volley_label.text = str(volleys)

func _on_goal_scored(ball : Ball, paddle : Paddle):
	_set_score_label_text(paddle)
	ball.queue_free()
	var newBall = Ball.new()
	control.add_child(newBall)
	ball.serve()

func _set_score_label_text(body : Paddle):
	left_score_label.text = str(int(left_score_label.text) + 1)
