extends Node2D

export (Array, PackedScene) var scenes

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	# There is 80% chance of the build have a board
	if rng.randi_range(0, 100) < 80:
		# Adding one of the possible boards
		add_child_below_node(self,scenes[rng.randi_range(0,scenes.size()-1)].instance())
