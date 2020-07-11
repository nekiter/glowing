extends "../../scripts/ShapeDrawing.gd"

var shapesArray = ["triangle", "circle", "square"]
export(Array, Color) var colorsArray = [Color(1.0, 0.0, 0.0), Color(0, 1.0, 0.0), Color(0.0, 0.0, 1.0)]
export(int) var currentShape = 2
export(int) var currentColor = 0
export(int) var width = 35
export(Vector2) var topLeftPostion = Vector2(815, 40)

var score = 0
var selected = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var currentPlayerInfo = get_node("/root/Game/PlayerSprite")

	shapesArray = currentPlayerInfo.get("shapesArray")
	colorsArray = currentPlayerInfo.get("colorsArray")
	currentShape = currentPlayerInfo.get("currentShape")
	currentColor = currentPlayerInfo.get("currentColor")
	colorsArray = colorsArray.duplicate()
	colorsArray.invert()

	get_node("Label").text = "Score: " + str(score)
	score += 1
	if score % 20 == 0:
		selected = !selected
	update()

func _draw():	
	var fullColor = false
	var colunm = 0
	var line = 2

	for color in colorsArray:
		colunm = 0
		for shape in shapesArray:
			fullColor = false
			colunm += 1
			var postion = Vector2(topLeftPostion.x + colunm*(width+21), topLeftPostion.y + line*(width+20))

			if shape == shapesArray[currentShape] and color == colorsArray[currentColor]:
				fullColor = true
			
			if(shape == "triangle"):
				if fullColor:
					if selected:
						draw_square(postion, width+14, Color(1.0, 1.0, 1.0))
					draw_triangle_poly(postion, width, colorsArray[line])
				else:
					draw_triangle(postion, width, colorsArray[line])
			elif(shape == "circle"):
				var angle_from = 0
				var angle_to = 360
				if fullColor:
					if selected:
						draw_square(postion, width+14, Color(1.0, 1.0, 1.0))
					draw_circle_arc_poly(postion, width/2, angle_from, angle_to, colorsArray[line])
				else:
					draw_circle_arc(postion, width/2, angle_from, angle_to, colorsArray[line])
			else:
				if fullColor:
					if selected:
						draw_square(postion, width+14, Color(1.0, 1.0, 1.0))
					draw_square_poly(postion, width, colorsArray[line])
				else:	
					draw_square(postion, width, colorsArray[line])
		line -= 1
