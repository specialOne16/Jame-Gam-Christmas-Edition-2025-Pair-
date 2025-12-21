extends Node
class_name PlayerMovement

@export var player: Player

const movement_speed = 100

var target_position: Vector2
var input_direction: Vector2
var movement_direction: Vector2 = Vector2.ZERO
var last_direction = "front"

func _ready() -> void:
	target_position = player.position

func _physics_process(delta: float) -> void:
	if player.level_finished: 
		player.animated_sprite_2d.play("idle_%s" % get_direction_name())
		return
	
	input_direction = Input.get_vector("left", "right", "up", "down")
	
	if player.position == target_position:
		player.animated_sprite_2d.play("idle_%s" % get_direction_name())
		
		set_movement_direction()
		
		if not player.wall_detectors[roundi(movement_direction.angle() / TAU * 4)].is_colliding():
			target_position = player.position + movement_direction * 40
			player.animated_sprite_2d.play("move_%s" % get_direction_name())
	
	player.position = player.position.move_toward(target_position, delta * movement_speed)

func get_direction_name() :
	var sprite_direction = movement_direction if movement_direction != Vector2.ZERO else input_direction
	var direction
	
	match sprite_direction.x:
		-1.0: direction = "left"
		1.0: direction = "right"
		
	match sprite_direction.y:
		-1.0: direction = "back"
		1.0: direction = "front"
	
	if direction: last_direction = direction
	
	return last_direction

func set_movement_direction():
	if input_direction == Vector2.ZERO: 
		movement_direction = Vector2.ZERO
	else:
		var new_direction = input_direction + movement_direction * 0.1
		movement_direction = Vector2.RIGHT.rotated(
			round(new_direction.angle() / TAU * 4) / 4 * TAU
		)
