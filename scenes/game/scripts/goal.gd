class_name Goal
extends Node2D
## The goal in which the player wants to hit the ball when it is their color.

@onready var goal_sprite_2d = $GoalSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	goal_sprite_2d.grow()

func reset():
	pass
