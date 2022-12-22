extends CanvasLayer

@export var auto_track_names : Array[String] = []
@export var auto_track_classes : Array[String] = []
@export var auto_track_groups : Array[String] = []

var tracker2d_scene : PackedScene = preload("res://addons/Tracker2D/tracker_2d.tscn")
var info_box_scene : PackedScene = preload("position_info_box.tscn")

func _ready():
	if ! OS.has_feature("standalone"):
		get_tree().node_added.connect(_handle_node_added)

func _process(delta):
	pass

func add_info_box( _tracker : Tracker2D ) -> void:
	var info_box : InfoBox = info_box_scene.instantiate()
	info_box.set_tracker( _tracker )
	$position_info_overlay.add_child( info_box )

func _handle_node_added( node : Node ) -> void:
	
	## try not to infinitely recurse
	if node is InfoBox or node.owner is InfoBox:
		return
	if node is Tracker2D or node.owner is Tracker2D:
		return

	var auto_track : bool = false

	if auto_track_names.has(node.name):
		auto_track = true
	elif auto_track_classes.has(node.get_class()):
		auto_track = true
	else:
		for group in node.get_groups():
			if auto_track_groups.has(group):
				auto_track = true
				break

	if auto_track:
		var tracker : Tracker2D = tracker2d_scene.instantiate()
		node.add_child(tracker)
