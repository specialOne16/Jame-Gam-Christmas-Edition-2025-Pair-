extends Area2D
class_name Decoration

signal picked_up

func _on_body_entered(_body: Node2D) -> void:
	picked_up.emit()
	queue_free()
