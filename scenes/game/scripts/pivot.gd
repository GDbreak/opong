class_name Pivot
extends Node2D
## The point which the paddle moves around.

@onready var multiplayer_synchronizer = $MultiplayerSynchronizer
@onready var paddle = $Paddle
var move_speed : int = 10
var move_direction : int = 0

func _ready():
	var id = name.to_int()
	multiplayer_synchronizer.set_multiplayer_authority(id)
	paddle.init(id)
	
func get_input():
	move_direction = Input.get_axis("move_counterclockwise", "move_clockwise")

func _process(delta):
	if multiplayer_synchronizer.get_multiplayer_authority() == multiplayer.get_unique_id():
		get_input()
		rotation += move_direction * move_speed * delta
