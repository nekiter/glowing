extends Node2D

export (Array, PackedScene) var scenes

var random_scene = RandomNumberGenerator.new()
var selected_scene_index = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	for scene in scenes:
		var tmp = scene.instance()
		add_child_below_node(self,tmp)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	random_scene.randomize()
	selected_scene_index = random_scene.randi_range(0,scenes.size()-1)
	var tmp = scenes[selected_scene_index].instance()
	add_child_below_node(self,tmp)
