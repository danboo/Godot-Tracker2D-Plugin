extends Control

class_name InfoBox

var _tracker : Tracker2D
var _parent : Node2D
var _market_style : int = Tracker2D.MARKER_STYLE.Cross
var _position_decimals : int = 1
var _rotation_decimals : int = 1
var _rotation_units : int = Tracker2D.ROTATION_UNITS.Radians
var _tracked_properties : Array[String] = []
var _display_rect : bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%main_panel.size = Vector2.ZERO
	set_name_visible(_tracker.display_node_name)
	set_position_visible(_tracker.display_position)
	set_global_position_visible(_tracker.display_global_position)
	set_position_decimals(_tracker.position_decimals)
	set_rotation_visible(_tracker.display_rotation)
	set_global_rotation_visible(_tracker.display_global_rotation)
	set_rotation_decimals(_tracker.rotation_decimals)
	set_rotation_units(_tracker.rotation_units)
	set_tracked_properties(_tracker.tracked_properties)
	set_marker_style(_tracker.marker_style)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	if _display_rect && _edit_use_rect():
		pass

	global_position = get_canvas_transform().affine_inverse() \
		* _parent.get_canvas_transform() \
		* _parent.global_position

	set_name_value(_parent.name)
	set_position_value(_parent.position)
	set_global_position_value(_parent.global_position)
	set_rotation_value(_parent.rotation)
	set_global_rotation_value(_parent.global_rotation)
	update_tracked_properties(_parent)
	
func _draw() -> void:
	match _market_style:
		Tracker2D.MARKER_STYLE.Cross:
			_draw_cross()
		Tracker2D.MARKER_STYLE.Point:
			_draw_point()
		Tracker2D.MARKER_STYLE.Circle:
			_draw_empty_circle()
		Tracker2D.MARKER_STYLE.None:
			pass

func _draw_point() -> void:
	draw_circle(Vector2.ZERO, 2, Color.WHITE)

func _draw_empty_circle() -> void:
	draw_arc(Vector2.ZERO, 4, 0, TAU, 32, Color.WHITE)

func _draw_cross() -> void:
	draw_line(Vector2(3, 0), Vector2(10, 0), Color.WHITE)
	draw_line(Vector2(0, 3), Vector2(0, 10), Color.WHITE)
	draw_line(Vector2(-3, 0), Vector2(-10, 0), Color.WHITE)
	draw_line(Vector2(0, -3), Vector2(0, -10), Color.WHITE)

func set_tracker(value : Tracker2D) -> void:
	_tracker = value
	_parent = _tracker.get_parent()

func set_display_rect(value : bool) -> void:
	_display_rect = value

func set_marker_style(value : Tracker2D.MARKER_STYLE) -> void:
	_market_style = value

func set_tracked_properties(value : Array[String]) -> void:
	_tracked_properties = value
	for property in _tracked_properties:
		%tracked_properties.add_child( Label.new() )

func set_rotation_units(value : int) -> void:
	_rotation_units = value

func set_rotation_decimals(value : int) -> void:
	_rotation_decimals = value

func set_position_decimals(value : int) -> void:
	_position_decimals = value

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

func update_tracked_properties( parent : Node ) -> void:
	for i in _tracked_properties.size():
		%tracked_properties.get_child(i).text = str( _tracked_properties[i], ": ", parent.get( _tracked_properties[i] ) )

func _format_position( vec2 : Vector2 ) -> String:
	var format_string = str('%.0', _position_decimals, 'f')
	return str( format_string % vec2.x, ', ', format_string % vec2.y)

func _format_rotation( rot : float ) -> String:
	var format_string = str('%.0', _rotation_decimals, 'f')
	if _rotation_units == Tracker2D.ROTATION_UNITS.Degrees:
		rot = rad_to_deg(rot)
	return str( format_string % rot )
