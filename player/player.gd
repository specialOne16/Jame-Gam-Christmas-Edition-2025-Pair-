extends CharacterBody2D
class_name Player

const BRIGHT_DOWN_SPEED = 0.2
const BRIGHT_UP_SPEED = 1.0
const MIN_BRIGHTNESS = 0.2
const MAX_BRIGHTNESS = 2.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var light: PointLight2D = %Light

var target_light
var level_finished = false

func _ready() -> void:
	target_light = MIN_BRIGHTNESS
	light.texture_scale = target_light

func brighten_light(on):
	if on: target_light = MAX_BRIGHTNESS

func _process(delta: float) -> void:
	if level_finished:
		light.texture_scale = move_toward(light.texture_scale, 10, delta * BRIGHT_UP_SPEED)
		return
	
	var speed = BRIGHT_DOWN_SPEED if light.texture_scale > target_light else BRIGHT_UP_SPEED
	light.texture_scale = move_toward(light.texture_scale, target_light, delta * speed)
	
	if light.texture_scale == target_light:
		target_light = MIN_BRIGHTNESS

func _physics_process(_delta: float) -> void:
	move_and_slide()
