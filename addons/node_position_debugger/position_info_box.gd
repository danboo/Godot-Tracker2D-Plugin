extends Control

class_name InfoBox

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _draw():
	draw_line(Vector2(3, 0), Vector2(10, 0), Color.WHITE)
	draw_line(Vector2(0, 3), Vector2(0, 10), Color.WHITE)
	draw_line(Vector2(-3, 0), Vector2(-10, 0), Color.WHITE)
	draw_line(Vector2(0, -3), Vector2(0, -10), Color.WHITE)

func set_name_visible(value : bool):
	%name_label.visible = value
	%name_separator.visible = value

func set_name_label( value : String ) -> void:
	%name_label.text = value

func set_position_label( value : Vector2 ) -> void:
	%position_label.text = _format_vector2(value)

func set_global_position_label( value : Vector2 ) -> void:
	%global_position_label.text = _format_vector2(value)

func _format_vector2( vec2 : Vector2 ) -> String:
	return str('%.01f' % vec2.x, ', ', '%.01f' % vec2.y)
