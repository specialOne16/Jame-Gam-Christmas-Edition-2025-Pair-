extends StaticBody2D
class_name Bell

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var level: Level

func _on_bell_stop_timer_timeout() -> void:
	animated_sprite_2d.play("default")


func _on_ring_area_body_entered(_body: Node2D) -> void:
	level.bell_ring()
	animated_sprite_2d.play("ring")
	$BellStopTimer.start()
