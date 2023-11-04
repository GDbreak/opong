class_name Pivot
extends Node2D
## The point which the paddle moves around.

var move_speed : int = 10
var move_direction : int = 0

func _ready():
	pass # Replace with function body.
	
func get_input():
	move_direction = Input.get_axis("move_counterclockwise", "move_clockwise")

func _process(delta):
	get_input()
	rotation += move_direction * move_speed * delta
