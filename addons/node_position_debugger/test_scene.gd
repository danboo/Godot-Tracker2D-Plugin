extends Node2D

var tracker_scene : PackedScene = preload("res://addons/node_position_debugger/tracker_2d.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var node1 = Node2D.new();
	node1.name = "Rotator 1"
	add_child( node1 );
	node1.position = Vector2(100,100)

	var tracker : Tracker2D = tracker_scene.instantiate()
	tracker.display_cross = false
	node1.add_child( tracker )
	
	var node2 = Node2D.new();
	node2.name = "Rotator 2"
	add_child( node2 );
	node2.position = Vector2(-100,-100)

	var node3 = Node2D.new();
	node3.name = "Invisible Name"
	add_child( node3 );
	node3.position = Vector2(100,-100)
	
	var node4 = Marker2D.new();
	node4.name = "Invisible Class"
	add_child( node4 );
	node3.position = Vector2(-100,100)

	var node5 = Node2D.new();
	node5.name = "Should Be Invisible"
	add_child( node5 );
	node3.position = Vector2(100,-100)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.global_rotation += 0.5 * delta
