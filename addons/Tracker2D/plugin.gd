@tool
extends EditorPlugin

#	Tracker2D plugin:
#		- add window, viewport and screen position options
#		- update info based on timer or per frame
#		- add option to keep info boxes in viewport (change BG color when tracked origin is outside viewport)
#		- test cases:

const AUTOLOAD_NAME :  String = "Tracker2D_Overlay"

func _enter_tree() -> void:
	add_autoload_singleton(AUTOLOAD_NAME, "res://addons/Tracker2D/position_info_overlay.tscn")

func _exit_tree() -> void:
	remove_autoload_singleton(AUTOLOAD_NAME)
