class_name VolleyLabel
extends Label

@onready var ball = $"../Control/Ball"

# Called when the node enters the scene tree for the first time.
func _ready():
	_connect_signals()

func _connect_signals():
	ball.volleyed.connect(_set_count)

func _set_count(volleys : int, body : Paddle):
	text = str(volleys)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
