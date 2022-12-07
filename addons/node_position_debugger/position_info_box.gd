extends Control

class_name InfoBox

var _is_cross_visible : bool = true
var _position_decimals : int = 1
var _rotation_decimals : int = 1
var _rotation_units : int = Tracker2D.ROTATION_UNITS.Radians

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%main_panel.size = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	pass
	
func _draw() -> void:
	if _is_cross_visible:
		draw_line(Vector2(3, 0), Vector2(10, 0), Color.WHITE)
		draw_line(Vector2(0, 3), Vector2(0, 10), Color.WHITE)
		draw_line(Vector2(-3, 0), Vector2(-10, 0), Color.WHITE)
		draw_line(Vector2(0, -3), Vector2(0, -10), Color.WHITE)

func set_rotation_units(value : int) -> void:
	_rotation_units = value

func set_rotation_decimals(value : int) -> void:
	_rotation_decimals = value

func set_position_decimals(value : int) -> void:
	_position_decimals = value

func set_cross_visible(value : bool) -> void:
	_is_cross_visible = value

func set_name_visible(value : bool) -> void:
	%name_value.visible = value
	%name_separator.visible = value

func set_position_visible(value : bool) -> void:
	%position_label.visible = value
	%position_value.visible = value

func set_global_position_visible(value : bool) -> void:
	%global_position_label.visible = value
	%global_position_value.visible = value

func set_rotation_visible(value : bool) -> void:
	%rotation_label.visible = value
	%rotation_value.visible = value

func set_global_rotation_visible(value : bool) -> void:
	%global_rotation_label.visible = value
	%global_rotation_value.visible = value

func set_name_value( value : String ) -> void:
	%name_value.text = value

func set_position_value( value : Vector2 ) -> void:
	%position_value.text = _format_position(value)

func set_global_position_value( value : Vector2 ) -> void:
	%global_position_value.text = _format_position(value)

func set_rotation_value( value : float ) -> void:
	%rotation_value.text = _format_rotation(value)

func set_global_rotation_value( value : float ) -> void:
	%global_rotation_value.text = _format_rotation(value)

func _format_position( vec2 : Vector2 ) -> String:
	var format_string = str('%.0', _position_decimals, 'f')
	return str( format_string % vec2.x, ', ', format_string % vec2.y)

func _format_rotation( rot : float ) -> String:
	var format_string = str('%.0', _rotation_decimals, 'f')
	if _rotation_units == Tracker2D.ROTATION_UNITS.Degrees:
		rot = rad_to_deg(rot)
	return str( format_string % rot )
