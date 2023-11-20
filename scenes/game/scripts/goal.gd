class_name Goal
extends Area2D
## The goal in which the player wants to hit the ball when it is their color.

signal goal_scored

@onready var goal_sprite_2d = $GoalSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	_connect_signals()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	goal_sprite_2d.grow()

func _connect_signals():
	self.body_entered.connect(_handle_goal)

func _handle_goal(body):
	if body is Ball:
		goal_scored.emit(body, body.last_contact)
		_reset()

func _reset():
	goal_sprite_2d.reset()
