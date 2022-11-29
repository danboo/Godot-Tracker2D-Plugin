extends CanvasLayer

var info_box_scene : PackedScene = preload("res://addons/node_position_debugger/position_info_box.tscn")
var tracked_nodes : Dictionary = {}

func _ready():

	## connect to node_added signal
	var scene_tree : SceneTree = get_tree()
	scene_tree.node_added.connect( _handle_node_added )
	scene_tree.node_removed.connect( _handle_node_removed )

func _process(delta):
	for tracked_node in tracked_nodes:
		var info_box : InfoBox = tracked_nodes[tracked_node]

#		https://www.reddit.com/r/godot/comments/iv18iq/how_do_you_position_an_overlay_ui_in_screen_space/
#		info_box.position = info_box.get_global_transform_with_canvas().affine_inverse() \
#			* tracked_node.get_global_transform_with_canvas() \
#			* tracked_node.position
		info_box.global_position = info_box.get_canvas_transform().affine_inverse() \
			* tracked_node.get_canvas_transform() \
			* tracked_node.global_position
		
		info_box.set_name_label(tracked_node.name)
		info_box.set_position_label(tracked_node.position)
		info_box.set_global_position_label(tracked_node.global_position)

func _handle_node_added( node : Node ) -> void:

	## try not to infinitely recurse
	if node is InfoBox or node.owner is InfoBox:
		return

	var info_box : InfoBox = info_box_scene.instantiate()
	tracked_nodes[node] = info_box
	add_child(info_box)

func _handle_node_removed( node : Node ) -> void:
	tracked_nodes.erase(node)
