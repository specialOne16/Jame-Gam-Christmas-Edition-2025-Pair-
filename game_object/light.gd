extends Area2D
class_name Light

@onready var panel: PanelContainer = $Panel

func switch(is_on: bool):
	panel.modulate = Color.CYAN if is_on else Color.WHITE
