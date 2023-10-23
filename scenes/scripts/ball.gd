class_name Ball
extends RigidBody2D
## The ball!
##
## TBD

@onready var screen_size = get_viewport_rect().size

@export var speed : int = 400
@export var target : Pivot

func _ready():
	randomize()

func _integrate_forces(state):
	var xform = state.transform
	xform.origin.x = wrapf(xform.origin.x, 0, screen_size.x)
	xform.origin.y = wrapf(xform.origin.y, 0, screen_size.y)
	state.transform = xform

func _process(delta):
	pass

func _physics_process(delta):
	pass
	#self.velocity = position.direction_to(target.position) * speed

func serve():
	pass
