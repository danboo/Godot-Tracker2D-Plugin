@tool
extends EditorPlugin

const AUTOLOAD_NAME :  String = "Tracker2D_Overlay"

func _enter_tree() -> void:
	add_autoload_singleton(AUTOLOAD_NAME, "res://addons/Tracker2D/position_info_overlay.tscn")

func _exit_tree() -> void:
	remove_autoload_singleton(AUTOLOAD_NAME)
