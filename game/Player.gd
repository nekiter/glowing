extends KinematicBody2D

var movement

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	
	if Input.is_action_just_pressed("ui_up"):
		$circle.visible = false
		$triangle.visible = false
		$square.visible = true
	
	if Input.is_action_just_pressed("ui_right"):
		$circle.visible = true
		$triangle.visible = false
		$square.visible = false
		
	if Input.is_action_just_pressed("ui_left"):
		$circle.visible = false
		$triangle.visible = true
		$square.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
