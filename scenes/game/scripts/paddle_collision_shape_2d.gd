class_name PaddleCollisionShape2D
extends CollisionShape2D
## Base class for all paddle collision shapes


@export var collision_speed : float = 0

@onready var paddle_audio_stream_player = $PaddleAudioStreamPlayer

func _ready():
	pass # Replace with function body.

func play():
	paddle_audio_stream_player.play()
