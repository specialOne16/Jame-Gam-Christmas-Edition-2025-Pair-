extends Area2D
class_name Player

const BRIGHT_DOWN_SPEED = 0.2
const BRIGHT_UP_SPEED = 1.0
const MIN_BRIGHTNESS = 0.2
const MAX_BRIGHTNESS = 2.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var wall_detectors: Array[RayCast2D] = [
	$WallDetectorRight, $WallDetectorBottom, $WallDetectorLeft, $WallDetectorUp
]
@onready var point_light_2d: PointLight2D = $PointLight2D
@export var bells: Array[Bell]

var target_light
var level_finished = false

func _ready() -> void:
	target_light = MIN_BRIGHTNESS
	point_light_2d.texture_scale = target_light
	for bell in bells:
		bell.ring.connect(brighten_light)

func brighten_light(on):
	if on: target_light = MAX_BRIGHTNESS

func _process(delta: float) -> void:
	if level_finished:
		point_light_2d.texture_scale = move_toward(point_light_2d.texture_scale, 10, delta * BRIGHT_UP_SPEED)
		return
	
	var speed = BRIGHT_DOWN_SPEED if point_light_2d.texture_scale > target_light else BRIGHT_UP_SPEED
	point_light_2d.texture_scale = move_toward(point_light_2d.texture_scale, target_light, delta * speed)
	
	if point_light_2d.texture_scale == target_light:
		target_light = MIN_BRIGHTNESS
