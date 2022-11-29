extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().create_timer(3.0).timeout.connect( func (): var node = Node2D.new(); add_child( node ); node.position = Vector2(10,10) )

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
