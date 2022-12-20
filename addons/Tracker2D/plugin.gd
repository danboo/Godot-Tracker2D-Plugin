@tool
extends EditorPlugin

#	Tracker2D plugin:
#		- auto-add Tracker2D based on by group, type or name
#		- add window, viewport and screen position options
#		- update info based on timer or per frame
#		- add option to keep info boxes in viewport (change BG color when tracked origin is outside viewport)

var config_dock_scene : PackedScene = preload("config_dock.tscn")
var config_dock : Control

const AUTOLOAD_NAME :  String = "Tracker2D_Overlay"

func _enter_tree() -> void:
	
	## add configuration dock
	config_dock = config_dock_scene.instantiate()
	config_dock.name = "Tracker2D"
	add_control_to_dock(DockSlot.DOCK_SLOT_LEFT_UR, config_dock)
	
	## add position overlay singleton
	add_autoload_singleton(AUTOLOAD_NAME, "res://addons/Tracker2D/position_info_overlay.tscn")

func _exit_tree() -> void:

	remove_control_from_docks(config_dock)
	config_dock.free()
	
	remove_autoload_singleton(AUTOLOAD_NAME)
