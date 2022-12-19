extends Node2D

var _tracker : Tracker2D
var _parent : Node2D

func _process(delta):
	global_rotation = _parent.global_rotation
	global_scale = _parent.global_scale

func _draw():
	if _tracker.display_rect && _parent._edit_use_rect():
		var rect : Rect2 = _parent._edit_get_rect()
		draw_rect(rect, Color.WHITE, false)

func set_tracker(value : Tracker2D) -> void:
	_tracker = value
	_parent = _tracker.get_parent()
