extends Node2D
class_name Level

const PLAYER = preload("uid://d3xkwguw2nb6a")
const BELL = preload("uid://cn76lvbnupsv6")
const LIGHT = preload("uid://duedsqdrcdpse")

const WIDTH = 8
const HEIGHT = 4

var _grid: Array[Array]

@onready var grid: Node2D = $Grid

func _ready() -> void:
	var player: Player = PLAYER.instantiate()
	player.grid_position = Vector2i.ZERO
	player.get_position_from_grid_position = Callable(self, "get_position_from_grid_position")
	grid.add_child(player)
	
	var bell1: Bell = BELL.instantiate()
	bell1.position = get_position_from_grid_position(Vector2i(4, 2))
	grid.add_child(bell1)
	
	var light1: Light = LIGHT.instantiate()
	light1.position = get_position_from_grid_position(Vector2i(2, 2))
	grid.add_child(light1)
	
	bell1.ring.connect(func(a): light1.switch(a))
	
	_grid.resize(HEIGHT)
	for h in HEIGHT:
		_grid[h].resize(WIDTH)
	
	#for w in WIDTH:
		#for h in HEIGHT:
			#var placeholder = PLACEHOLDER.instantiate()
			#placeholder.position = Vector2(w, h) * 45
			#grid.add_child(placeholder)
	
	@warning_ignore("integer_division")
	grid.position = Vector2(640 / 2 - WIDTH * 45 / 2, 360 / 2 - HEIGHT * 45 / 2) + Vector2.ONE * 50 / 2

func get_position_from_grid_position(grid_position: Vector2i):
	if Rect2i(Vector2i.ZERO, Vector2i(WIDTH, HEIGHT)).has_point(grid_position):
		return grid_position * 45
	
	return null
