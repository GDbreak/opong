class_name Ball
extends RigidBody2D
## the Disloyal Round Thing that refuses to go into the Goal

signal volleyed

@onready var screen_size = get_viewport_rect().size
@export var speed : int = 10
@export var target : Pivot
@export var force : Vector2

var ball_initial_position: = Vector2.ZERO

var volleys : int = 0
var last_contact : Paddle

func _ready():
	ball_initial_position = position
	_connect_signals()
	randomize()
	serve()

func _connect_signals():
	body_exited.connect(_on_body_exited)
	body_shape_entered.connect(_on_body_shape_entered)

func _set_color(color : Color):
	modulate = color

func set_speed():
	pass
	# todo set the speed of the ball based on the volley count
	# todo set the speed of the ball based on what part of the paddle it touched

func _integrate_forces(state):
	_wrap_around_viewport(state)
	
func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if (body is Paddle):
		last_contact = body
		_set_color(body.color)
		_handle_impulse(body, body_shape_index)

func _on_body_exited(body):
	if (body is Paddle):
		volleys += 1
		volleyed.emit(volleys, body)

func _handle_impulse(body : Paddle, body_shape_index : int):
	var paddle_collision_object_2d = body.shape_owner_get_owner(body.shape_find_owner(body_shape_index))
	var speed = paddle_collision_object_2d.collision_speed 
	var impulse = Vector2(speed,speed) 
	apply_impulse(impulse)
	
func _physics_process(delta):
	pass
	#self.velocity = position.direction_to(target.position) * speed

func _wrap_around_viewport(state):
	var xform = state.transform
	xform.origin.x = wrapf(xform.origin.x, 0, screen_size.x)
	xform.origin.y = wrapf(xform.origin.y, 0, screen_size.y)
	state.transform = xform

func serve():
	var strength: = 1000
	var impulse_vector = Vector2(strength, strength)
	apply_impulse(impulse_vector)
	
#func make_static_and_set_position(position:Vector2):
#	_position = position
#	_reset_position = true
#
#func make_ridid_deferred() -> void:
#	set_deferred("mode", RigidBody2D.MODE_RIGID)
#	ball_collision_shape.set_deferred("disabled", false)
#
#func make_static_deferred() -> void:
#	set_deferred("mode", RigidBody2D.MODE_STATIC)
#	ball_collision_shape.set_deferred("disabled", true)
