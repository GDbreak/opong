class_name OptionsVboxContainer
extends VBoxContainer
# The Vbox container in the lobby menu that shows initial options

signal start_hosting
signal start_joining

@onready var host_button : Button = $HostButton
@onready var join_button : Button = $JoinButton

func _ready():
	_connect_signals()

func _process(delta):
	pass

func _connect_signals():
	host_button.pressed.connect(func(): start_hosting.emit())
	join_button.pressed.connect(func(): start_joining.emit())
