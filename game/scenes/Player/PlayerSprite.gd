extends "../../../scripts/ShapeDrawing.gd"

var shapesArray = ["triangle", "circle", "square"]
export(Array, Color) var colorsArray = [Color(1.0, 0.0, 0.0), Color(0, 1.0, 0.0), Color(0.0, 0.0, 1.0)]
export(int) var currentShape = 2
export(int) var currentColor = 0
export(int) var width = 50
export(Vector2) var centerPosition = Vector2(200, 200)

var red = Color(1.0, 0.0, 0.0)
var blue = Color(0, 0.0, 1.0)
var green = Color(0.0, 1.0, 0.0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_right"):
		currentShape += 1
		
	if Input.is_action_just_pressed("ui_left"):
		currentShape -= 1

	if currentShape > 2:
		currentShape = 0
	if currentShape < 0:
		currentShape = 2

	if Input.is_action_just_pressed("ui_up"):
		currentColor += 1
		
	if Input.is_action_just_pressed("ui_down"):
		currentColor -= 1

	if currentColor > colorsArray.size()-1:
		currentColor = 0
	if currentColor < 0:
		currentColor = colorsArray.size()-1
	update()

func _draw():	
	var spriteControl = get_node("Player/AnimatedSprite")

	if(shapesArray[currentShape] == "triangle"):
		if colorsArray[currentColor] == blue:
			spriteControl.set_animation("running-triangle-blue")
		elif colorsArray[currentColor] == red:
			spriteControl.set_animation("running-triangle-red")
		else:
			spriteControl.set_animation("running-triangle-green")
		# draw_triangle(centerPosition, width, colorsArray[currentColor])
	elif(shapesArray[currentShape] == "circle"):
		if colorsArray[currentColor] == blue:
			spriteControl.set_animation("running-circle-blue")
		elif colorsArray[currentColor] == red:
			spriteControl.set_animation("running-circle-red")
		else:
			spriteControl.set_animation("running-circle-green")
		# var angle_from = 0
		# var angle_to = 360
		# draw_circle_arc(centerPosition, width/2, angle_from, angle_to, colorsArray[currentColor])
	else:
		if colorsArray[currentColor] == blue:
			spriteControl.set_animation("running-square-blue")
		elif colorsArray[currentColor] == red:
			spriteControl.set_animation("running-square-red")
		else:
			spriteControl.set_animation("running-square-green")
		# draw_square(centerPosition, width, colorsArray[currentColor])
