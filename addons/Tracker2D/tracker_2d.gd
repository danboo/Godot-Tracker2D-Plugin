extends Node2D
class_name Tracker2D

var info_box_scene : PackedScene = preload("position_info_box.tscn")

enum MARKER_STYLE { Cross, Point, Circle, None }
enum ROTATION_UNITS { Radians, Degrees }

@export_group("Position")
@export var display_position : bool = true
@export var display_global_position : bool = true
@export var display_viewport_position : bool = false
@export var display_window_position : bool = false
@export var display_screen_position : bool = false
@export_range(0, 9, 1) var position_decimals : int = 1

@export_group("Rotation")
@export var display_rotation : bool = true
@export var display_global_rotation : bool = true
@export var rotation_units : ROTATION_UNITS = ROTATION_UNITS.Radians
@export_range(0, 9, 1) var rotation_decimals : int = 1

@export_group("", "")
@export var display_node_name : bool = true
@export var marker_style : MARKER_STYLE = MARKER_STYLE.Cross
@export var display_rect : bool = false
@export var tracked_properties : Array[String]

@onready var _parent : Node = get_parent()

func _ready():
	## disable in released games
	if OS.has_feature("standalone"):
		queue_free()
		return

	Tracker2D_Overlay.add_info_box( self )
