extends Area2D
class_name ChristmastTree

func _on_area_entered(area: Area2D) -> void:
	if area is Player:
		area.level_finished = true
