@tool
extends EditorPlugin

#	Tracker2D plugin:
#		- auto-add Tracker2D based on by group, type or name
#		- choose image (cross, dot, circle)
#		- toggle display node name
#			- choose font / size
#		- use _edit_use_rect and _edit_get_rect to draw a bounding box
#		- add window, viewport and screen position options
#		- use OS.has_feature("standalone") to disable in exported games
#		- update info based on timer or per frame

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
