extends CanvasLayer

var info_box_scene : PackedScene = preload("position_info_box.tscn")

func _ready():
	pass

func _process(delta):
	pass

func add_info_box( _tracker : Tracker2D ) -> void:
	var info_box : InfoBox = info_box_scene.instantiate()
	info_box.set_tracker( _tracker )
	$position_info_overlay.add_child( info_box )
