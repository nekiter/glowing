extends Node2D

export (Array, PackedScene) var buildings

var rng = RandomNumberGenerator.new()
var selected_scene_index = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Timer_timeout():
	rng.randomize()
	selected_scene_index = rng.randi_range(0,buildings.size()-1)
	var tmp = buildings[selected_scene_index].instance()
	add_child_below_node(self,tmp)
	
	#Randomizing next wait time
	$Timer.set_wait_time(rng.randf_range(0.5,0.9))
	
