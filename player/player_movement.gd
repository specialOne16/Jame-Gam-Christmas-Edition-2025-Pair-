extends Node
class_name PlayerMovement

@export var player: Player

const movement_speed = 100

var last_direction = "front"

func _physics_process(_delta: float) -> void:
	if player.level_finished: 
		player.animated_sprite_2d.play("idle_%s" % get_direction_name())
		player.velocity = Vector2.ZERO
		return
	
	var input_direction = Input.get_vector("left", "right", "up", "down")
	
	if input_direction == Vector2.ZERO: player.animated_sprite_2d.play("idle_%s" % get_direction_name())
	else: player.animated_sprite_2d.play("move_%s" % get_direction_name())
	
	player.velocity = input_direction * movement_speed

func get_direction_name() :
	var direction
	
	match player.velocity.x:
		-1.0: direction = "left"
		1.0: direction = "right"
		
	match player.velocity.y:
		-1.0: direction = "back"
		1.0: direction = "front"
	
	if direction: last_direction = direction
	
	return last_direction
