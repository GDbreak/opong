class_name Paddle
extends CharacterBody2D
## The paddle that is used to hit th eball during gameplay. Can be rotated.
##
## TBD

signal special_invoked()
signal moved(position)
signal rotated(rotation)

@export var rotation_speed = 10
var rotation_direction = 0
var d := 0.0
var speed := 2.0
var radius = 250

func _ready():
	pass 

func get_input():
	rotation_direction = Input.get_axis("rotate_clockwise", "rotate_counterclockwise")

func _process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
#	d += delta 
#	position = (Vector2(sin(move_direction * speed) * radius, cos(move_direction * speed) * radius) + Vector2(250,250))

