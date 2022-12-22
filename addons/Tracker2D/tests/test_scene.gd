extends Node2D

var tracker_scene : PackedScene = preload("../tracker_2d.tscn")

func _ready():
	## set auto track arrays for testing purposes
	Tracker2D_Overlay.auto_track_names = [ "auto_track_test_name" ]
	Tracker2D_Overlay.auto_track_classes = [ "PointLight2D" ]
	Tracker2D_Overlay.auto_track_groups = [ "auto_track_test_group" ]

	## build test scenes
	test_node2d()
	test_sprite()
	test_removal()
	test_auto_track_name()
	test_auto_track_class()
	test_auto_track_group()

func _process(delta):
	$rotator.global_rotation += 0.1 * delta

func test_sprite() -> void:
	var sprite_tracker : Tracker2D = tracker_scene.instantiate()
	sprite_tracker.display_rect = true
	sprite_tracker.tracked_properties = [ "modulate" ]
	$rotator/occluded_sprite.add_child( sprite_tracker )

func test_node2d() -> void:
	var node1 = Node2D.new();
	node1.name = "no_rect"
	$rotator.add_child( node1 );
	node1.position = Vector2(-100,-100)

	var tracker : Tracker2D = tracker_scene.instantiate()
	node1.add_child( tracker )

func test_removal() -> void:
	var node1 = Node2D.new();
	node1.name = "removal"
	$rotator.add_child( node1 );
	node1.position = Vector2(100,-100)

	var tracker : Tracker2D = tracker_scene.instantiate()
	node1.add_child( tracker )
	
	get_tree().create_timer(3).timeout.connect( func (): node1.queue_free() )

func test_auto_track_name() -> void:
	var scene : PackedScene = preload("res://addons/Tracker2D/tests/add_by_name.tscn")
	var node : Node2D = scene.instantiate()
	$rotator.add_child(node)
	node.position = Vector2(-100, 100)

func test_auto_track_class() -> void:
	var scene : PackedScene = preload("res://addons/Tracker2D/tests/add_by_class.tscn")
	var node : PointLight2D = scene.instantiate()
	$rotator.add_child(node)
	node.position = Vector2(-100, 0)

func test_auto_track_group() -> void:
	var scene : PackedScene = preload("res://addons/Tracker2D/tests/add_by_group.tscn")
	var node : Node2D = scene.instantiate()
	$rotator.add_child(node)
	node.position = Vector2(100, 0)
