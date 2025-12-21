extends Area2D
class_name Player

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var wall_detectors: Array[RayCast2D] = [
	$WallDetectorRight, $WallDetectorBottom, $WallDetectorLeft, $WallDetectorUp
]
