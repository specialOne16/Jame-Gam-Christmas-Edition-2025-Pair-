extends Area2D
class_name Bell

signal ring(is_ringing: bool)

@onready var panel: PanelContainer = $Panel

func _on_area_entered(_area: Area2D) -> void:
	ring.emit(true)
	panel.modulate = Color.CYAN


func _on_area_exited(_area: Area2D) -> void:
	ring.emit(false)
	panel.modulate = Color.WHITE
