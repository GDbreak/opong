class_name Pivot
extends Node2D
## The point which the paddle moves around.
##
## TBD

var move_speed = 10
var move_direction = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func get_input():
	move_direction = Input.get_axis("move_counterclockwise", "move_clockwise")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()
	rotation += move_direction * move_speed * delta
