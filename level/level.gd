extends Node2D
class_name Level

@onready var player: Player = $Player

@onready var collect_notification: PanelContainer = $CanvasLayer/CollectNotification
@onready var collect_notification_label: Label = $CanvasLayer/CollectNotification/CollectNotificationLabel
@onready var collect_notification_timer: Timer = $CanvasLayer/CollectNotificationTimer

func bell_ring():
	player.brighten_light(true)


func collect_item(item_name: String):
	collect_notification_label.text = "%s collected!" % item_name
	collect_notification.visible = true
	collect_notification_timer.start()

func _on_collect_notification_timer_timeout() -> void:
	collect_notification.visible = false
