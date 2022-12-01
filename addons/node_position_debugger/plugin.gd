@tool
extends EditorPlugin

#	marker plugin:
#		- create a plugin to show node positions at runtime (similar to Marker3D)
#		- choose nodes to render by group, type or name
#		- creates a global canvas layer to render to
#		- choose image (cross, dot)
#		- toggle show position as text
#			- choose font / size
#			- choose decimals
#		- toggle display node name
#			- choose font / size
#		- draw line length relative to camera zoom
#		- use _edit_use_rect and _edit_get_rect to draw a bounding box
#		- use SceneTree.node_added signal to track nodes by class
#			- as they are added add them to a group
#		- addon conversion ideas
#			- render to a single CanvasLayer
#			- add nodes to canvs layer to track debug nodes in group
#       - add window, viewport and screen position options
#       - allow user to track and display arbitrary properties of a node (rename to GodotNodeTracker?)

var config_dock_scene : PackedScene = preload("res://addons/node_position_debugger/config_dock.tscn")
var config_dock : Control

const AUTOLOAD_NAME :  String = "PositionDebuggerOverlay"

func _enter_tree() -> void:
	
	## add configuration dock
	config_dock = config_dock_scene.instantiate()
	config_dock.name = "PositionDebugger"
	add_control_to_dock(DockSlot.DOCK_SLOT_LEFT_UR, config_dock)
	
	## add position overlay singleton
	add_autoload_singleton(AUTOLOAD_NAME, "res://addons/node_position_debugger/position_info_overlay.tscn")

func _exit_tree() -> void:
	remove_control_from_docks(config_dock)
	config_dock.free()
	
	remove_autoload_singleton(AUTOLOAD_NAME)
