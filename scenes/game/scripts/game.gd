class_name Game
extends Node
## The parent node of all others during gameplay. The scene in which O-Pong takes place.

@onready var ball : Ball = $Control/Ball
@onready var goal : Goal = $Control/Goal
@onready var volley_label : VolleyLabel = $VolleyLabel
@onready var left_score_label = $LeftPanelVbox/ScoreLabel

func _ready():
	_connect_signals()
	
func _connect_signals():
	ball.volleyed.connect(_set_volley_label_text)
	goal.goal_scored.connect(_set_score_label_text)
	
func _set_volley_label_text(volleys : int, body : Paddle):
	volley_label.text = str(volleys)

func _set_score_label_text(body : Paddle):
	left_score_label.text = int(left_score_label.text) + 1
