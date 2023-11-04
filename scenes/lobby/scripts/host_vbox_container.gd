class_name HostVboxContainer
extends VBoxContainer
# The lobby menu for hosting games


signal start_game

@onready var start_button : Button = $StartButton

# Called when the node enters the scene tree for the first time.
func _ready():
	_connect_signals()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _connect_signals():
	start_button.pressed.connect(func(): start_game.emit())
