extends RigidBody2D


var velocity = Vector2.ZERO
var current_frame = 0
export var jump_force = 20

onready var player = get_node("/root/Game/PlayerSprite")
onready var spriteControl = get_node("AnimatedSprite")

var forceApplied = false
# var origin_position = player.get_position()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var spriteControl = get_node("AnimatedSprite")

	if (player.shapesArray[player.currentShape] == "square"):
		# print(spriteControl.frame)
		if spriteControl.frame == 7 and !forceApplied:
			forceApplied = true
			apply_central_impulse(Vector2(0,-jump_force))
		else:
			forceApplied = false


