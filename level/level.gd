extends Node2D
class_name Level

@onready var player: Player = $Player

func bell_ring():
	player.brighten_light(true)
