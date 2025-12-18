extends Node
class_name PlayerMovement

@export var player: Player

const movement_speed = 100

var target_position: Vector2
var input_direction: Vector2
var movement_direction: Vector2


func _process(delta: float) -> void:
	# TODO need to ensure only go one direction especially when input is analog
	input_direction = Input.get_vector("left", "right", "up", "down")
	
	if player.position == target_position:
		var temp_grid_position = player.grid_position + Vector2i(input_direction)
		var temp_target_position = player.get_position_from_grid_position.call(temp_grid_position)
		if temp_target_position != null:
			target_position = temp_target_position
			player.grid_position = temp_grid_position
	
	player.position = player.position.move_toward(target_position, delta * movement_speed)
