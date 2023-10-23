class_name MainMenu
extends Control

@onready var play_button : Button = $Play
@onready var game_scene : PackedScene = preload(game_scene_path)
const game_scene_path : String = "res://scenes/game.tscn"

func _ready():
	play_button.pressed.connect(_start_game)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _start_game():
	var current_scene = game_scene.instantiate()
	get_tree().get_root().add_child(current_scene)
	self.queue_free()
