extends Node2D
class_name Tracker2D

@export_group("Position")
@export var display_position : bool = true
@export var display_global_position : bool = true
@export var display_viewport_position : bool = false
@export var display_window_position : bool = false
@export var display_screen_position : bool = false
@export_range(0, 10, 1) var position_decimals : int = 1

@export_group("Rotation")
@export var display_rotation : bool = true
@export var display_global_rotation : bool = true
@export_enum("Degrees", "Radians") var rotation_units : int = 0

@export_group("", "")
@export var display_node_name : bool = true
@export var display_cross : bool = true
@export var display_bounding_box : bool = true
@export var tracked_node_properties : Array[String]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
