extends Node2D

var tracker_scene : PackedScene = preload("tracker_2d.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	test_node2d()
	test_sprite()
	test_removal()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.global_rotation += 0.1 * delta

func test_sprite() -> void:
	var sprite_tracker : Tracker2D = tracker_scene.instantiate()
	sprite_tracker.display_rect = true
	sprite_tracker.tracked_properties = [ "modulate" ]
	$sprite.add_child( sprite_tracker )

func test_node2d() -> void:
	var node1 = Node2D.new();
	node1.name = "no_rect"
	add_child( node1 );
	node1.position = Vector2(-100,-100)

	var tracker : Tracker2D = tracker_scene.instantiate()
	node1.add_child( tracker )

func test_removal() -> void:
	var node1 = Node2D.new();
	node1.name = "removal"
	add_child( node1 );
	node1.position = Vector2(100,-100)

	var tracker : Tracker2D = tracker_scene.instantiate()
	node1.add_child( tracker )
	
	get_tree().create_timer(3).timeout.connect( func (): node1.queue_free() )
