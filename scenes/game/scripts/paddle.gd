class_name Paddle
extends CharacterBody2D
## The paddle that is used to hit the ball during gameplay. Can be rotated.

signal special_invoked()
signal moved(position)
signal rotated(rotation)

@export var rotation_speed = 10
@export var color : Color

var rotation_direction : int = 0
var radius : int = 180

var _id = -1

func _ready():
	pass

func init(id : int):
	_id = id

func get_input():
	rotation_direction = Input.get_axis("rotate_clockwise", "rotate_counterclockwise")

func _process(delta):
	if _id == multiplayer.get_unique_id():
		get_input()
		rotation += rotation_direction * rotation_speed * delta

