extends CanvasLayer

const TRACKER_2D_GROUP : String = "tracker_2d_nodes"

var info_box_scene : PackedScene = preload("res://addons/node_position_debugger/position_info_box.tscn")
var tracked_nodes : Dictionary = {}

var group_filter : Dictionary = {}
var class_filter : Dictionary = {}
var name_filter : Dictionary = {}

func _ready():
	## connect to node_added signal
#	var scene_tree : SceneTree = get_tree()
#	scene_tree.node_added.connect( _handle_node_added )
#	scene_tree.node_removed.connect( _handle_node_removed )
	pass

func _process(delta):

	var seen : Dictionary = {}

	for tracker in get_tree().get_nodes_in_group(TRACKER_2D_GROUP):
		var parent : CanvasItem = tracker.get_parent()
		var info_box : InfoBox

		if tracked_nodes.has(tracker):
			info_box = tracked_nodes[tracker]
		else:
			info_box = info_box_scene.instantiate()
			tracked_nodes[tracker] = info_box
			add_child(info_box)

		seen[tracker] = 1

		info_box.global_position = info_box.get_canvas_transform().affine_inverse() \
			* parent.get_canvas_transform() \
			* parent.global_position

		info_box.set_name_visible(tracker.display_node_name)
		info_box.set_name_label(parent.name)
		info_box.set_position_label(parent.position)
		info_box.set_global_position_label(parent.global_position)

	## remove tracked nodes that weren't seen in the group
	for node in tracked_nodes:
		if ! seen.has(node):
			var info_box : InfoBox = seen[node]
			tracked_nodes.erase(node)
			info_box.queue_free()

#	for tracked_node in tracked_nodes:
#		var info_box : InfoBox = tracked_nodes[tracked_node]
#
##		https://www.reddit.com/r/godot/comments/iv18iq/how_do_you_position_an_overlay_ui_in_screen_space/
##		info_box.position = info_box.get_global_transform_with_canvas().affine_inverse() \
##			* tracked_node.get_global_transform_with_canvas() \
##			* tracked_node.position
#		info_box.global_position = info_box.get_canvas_transform().affine_inverse() \
#			* tracked_node.get_canvas_transform() \
#			* tracked_node.global_position
#
#		info_box.set_name_label(tracked_node.name)
#		info_box.set_position_label(tracked_node.position)
#		info_box.set_global_position_label(tracked_node.global_position)

#func _handle_node_added( node : Node ) -> void:
#
#	## try not to infinitely recurse
#	if node is InfoBox or node.owner is InfoBox:
#		return
#
#	## short-circuit if a class filter is defined and the node class isn't included
#	## note that get_class() only returns the native class name, not custom `class_name`
#	## https://github.com/godotengine/godot/issues/21789
#	if class_filter.size() > 0 && ! class_filter.has( node.get_class() ):
#		return
#
#	## short-circuit if a group filter is defined and the node is not a member of any group
#	if group_filter.size() > 0:
#		var is_group_found : bool = false
#		for group in node.get_groups():
#			if group_filter.has(group):
#				is_group_found = true
#				break
#		if ! is_group_found:
#			return
#
#	## short-circuit if a name filter is defined and the node name isn't included
#	if name_filter.size() > 0 && ! name_filter.has( node.name ):
#		return
#
#	var info_box : InfoBox = info_box_scene.instantiate()
#	tracked_nodes[node] = info_box
#	add_child(info_box)

#func _handle_node_removed( node : Node ) -> void:
#	tracked_nodes.erase(node)
