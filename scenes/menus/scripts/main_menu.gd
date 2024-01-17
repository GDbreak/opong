class_name MainMenu
extends Control

@onready var play_button : Button = $Play
@onready var lobby_scene : PackedScene = preload(lobby_scene_path)
const lobby_scene_path : String = "res://scenes/lobby/lobby_ui.tscn"

func _ready():
	play_button.pressed.connect(_start_game)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _start_game():
	var current_scene = lobby_scene.instantiate()
	get_parent().add_child(current_scene)
	self.queue_free()
