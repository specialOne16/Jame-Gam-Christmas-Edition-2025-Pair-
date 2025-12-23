extends StaticBody2D
class_name ChristmastTree

func _on_gather_area_body_entered(body: Node2D) -> void:
	if body is Player:
		body.level_finished = true
