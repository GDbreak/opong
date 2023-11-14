class_name GoalSprite2D
extends Sprite2D
## TBD

@onready var x_size : float = 1
@onready var y_size : float = 1

var _increment : float = .0000001

func grow():
	if scale.x < 2 && scale.y < 2:
		x_size += _increment
		y_size += _increment
		apply_scale(Vector2(x_size, y_size))

func reset():
	x_size = 1
	y_size = 1
	apply_scale(Vector2(x_size, y_size))
