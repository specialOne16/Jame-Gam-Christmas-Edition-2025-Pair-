extends Area2D

@export var level: Level
@export var item_name: String
@export var inventory_node: TextureRect

func _on_body_entered(_body: Node2D) -> void:
	level.collect_item(item_name)
	inventory_node.modulate = Color.WHITE
	queue_free()
