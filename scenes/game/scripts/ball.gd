class_name Ball
extends RigidBody2D
## the Disloyal Round Thing that refuses to go into the Goal

@onready var screen_size = get_viewport_rect().size

@export var speed : int = 400
@export var target : Pivot
@export var force : Vector2

func _ready():
	_connect_signals()
	randomize()

func _connect_signals():
	self.body_entered.connect(_set_force)

func set_color():
	pass

func set_speed():
	pass
	# todo set the speed of the ball based on the volley count
	# todo set the speed of the ball based on what part of the paddle it touched

func _integrate_forces(state):
	_wrap_around_viewport(state)
	
func _set_force(body):
	if (body is Paddle):
		apply_impulse(body.force)
	
func _physics_process(delta):
	pass
	#self.velocity = position.direction_to(target.position) * speed

func _wrap_around_viewport(state):
	var xform = state.transform
	xform.origin.x = wrapf(xform.origin.x, 0, screen_size.x)
	xform.origin.y = wrapf(xform.origin.y, 0, screen_size.y)
	state.transform = xform

func serve():
	pass
