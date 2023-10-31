class_name Lobby
extends Control

@onready var options_vbox_container = $OptionsVboxContainer
@onready var host_vbox_container = $HostVboxContainer
@onready var join_vbox_container = $JoinVboxContainer
@onready var game_scene : PackedScene = preload(game_scene_path)
const game_scene_path : String = "res://scenes/game.tscn"

func _ready():
	_connect_signals()

func _connect_signals():
	options_vbox_container.start_hosting.connect(_show_hosting_menu)
	options_vbox_container.start_joining.connect(_show_joining_menu)

func _show_hosting_menu():
	options_vbox_container.visible = false
	host_vbox_container.visible = true

func _show_joining_menu():
	options_vbox_container.visible = false
	host_vbox_container.visible = true
