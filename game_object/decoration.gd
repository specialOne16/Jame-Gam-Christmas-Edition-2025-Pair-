extends Area2D
class_name Decoration

signal picked_up

func _on_area_entered(_area: Area2D) -> void:
	picked_up.emit()
	queue_free()
