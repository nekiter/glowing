extends KinematicBody2D

var velocity = Vector2.ZERO
var current_frame = 0

export var gravity_scale = 1
export var jump_velocity = 20

onready var player = get_node("/root/Game/PlayerSprite")
onready var spriteControl = get_node("AnimatedSprite")

# var origin_position = player.get_position()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# var spriteControl = get_node("AnimatedSprite")

	if (player.shapesArray[player.currentShape] == "square"):
		print(spriteControl.frame)
		# if (spriteControl.frame == 7):
			# velocity.y -= jump_velocity

	if (player.shapesArray[player.currentShape] == "circle"):
		velocity = Vector2.ZERO

	if (player.shapesArray[player.currentShape] == "triangle"):
		velocity = Vector2.ZERO

func _physics_process(delta):
	velocity.y += gravity_scale
	var collision = move_and_collide(velocity*delta)


func _on_Area2D_area_entered(area):
	velocity = Vector2.ZERO
	pass # Replace with function body.
