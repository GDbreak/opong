class_name Game
extends Node
## The parent node of all others during gameplay. The scene in which O-Pong takes place.

@export var pivot_scene : PackedScene

@onready var control = $Control
@onready var ball : Ball = $Control/Ball
@onready var goal : Goal = $Control/Goal
@onready var volley_label : VolleyLabel = $VolleyLabel
@onready var left_score_label = $LeftPanelVbox/ScoreLabel

func _ready():
	_connect_signals()
	var index = 0
	for i in Lobby.players:
		var current_player = pivot_scene.instantiate()
		current_player.name = str(Lobby.players[i].id)
		add_child(current_player)
		for spawn in get_tree().get_nodes_in_group("PlayerSpawnPoint"):
			if spawn.name == str(index):
				current_player.global_position = spawn.global_position
		if index == 1:
			current_player.rotation = -90
		index += 1
		
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
