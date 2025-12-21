extends Area2D
class_name Bell

signal ring(is_ringing: bool)

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _on_area_entered(_area: Area2D) -> void:
	ring.emit(true)
	animated_sprite_2d.play("ring")
	$BellStopTimer.start()

func _on_bell_stop_timer_timeout() -> void:
	ring.emit(false)
	animated_sprite_2d.play("default")
