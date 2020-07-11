extends Node2D

var shapesArray = ["triangle", "circle", "square"]
export(Array, Color) var colorsArray = [Color(1.0, 0.0, 0.0), Color(0, 1.0, 0.0), Color(0.0, 0.0, 1.0)]
export(int) var currentShape = 2
export(int) var currentColor = 0
export(int) var width = 50
export(Vector2) var centerPosition = Vector2(200, 200)
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
	
	if(shapesArray[currentShape] == "triangle"):
		draw_triangle(centerPosition, width, colorsArray[currentColor])
	elif(shapesArray[currentShape] == "circle"):
		var angle_from = 0
		var angle_to = 360
		draw_circle_arc(centerPosition, width/2, angle_from, angle_to, colorsArray[currentColor])
	else:
		draw_square(centerPosition, width, colorsArray[currentColor])
	
	
func draw_square(center, width, color):
	var points_arc = PoolVector2Array()

	points_arc.push_back(Vector2(center.x - width/2, center.y - width/2))
	points_arc.push_back(Vector2(center.x + width/2, center.y - width/2))
	points_arc.push_back(Vector2(center.x + width/2, center.y + width/2))
	points_arc.push_back(Vector2(center.x - width/2, center.y + width/2))

	for index_point in range(points_arc.size()-1):
		draw_line(points_arc[index_point], points_arc[index_point + 1], color)

	draw_line(points_arc[points_arc.size()-1], points_arc[0], color)

func draw_square_poly(center, width, color):
	var points_arc = PoolVector2Array()

	points_arc.push_back(Vector2(center.x - width/2, center.y - width/2))
	points_arc.push_back(Vector2(center.x + width/2, center.y - width/2))
	points_arc.push_back(Vector2(center.x + width/2, center.y + width/2))
	points_arc.push_back(Vector2(center.x - width/2, center.y + width/2))

	var colors = PoolColorArray([color])
	draw_polygon(points_arc, colors)

func draw_triangle(center, width, color):
	var points_arc = PoolVector2Array()

	points_arc.push_back(Vector2(center.x - width/2, center.y + width/2))
	points_arc.push_back(Vector2(center.x + width/2, center.y + width/2))
	points_arc.push_back(Vector2(center.x, center.y - cos(deg2rad(60))*width/2))

	for index_point in range(points_arc.size()-1):
		draw_line(points_arc[index_point], points_arc[index_point + 1], color)

	draw_line(points_arc[points_arc.size()-1], points_arc[0], color)

func draw_triangle_poly(center, width, color):
	var points_arc = PoolVector2Array()

	points_arc.push_back(Vector2(center.x - width/2, center.y - width/2))
	points_arc.push_back(Vector2(center.x + width/2, center.y - width/2))
	points_arc.push_back(Vector2(center.x, center.y + cos(deg2rad(60))*width/2))

	var colors = PoolColorArray([color])
	draw_polygon(points_arc, colors)
	

func draw_circle_arc(center, radius, angle_from, angle_to, color):
	var nb_points = 32
	var points_arc = PoolVector2Array()

	for i in range(nb_points + 1):
		var angle_point = deg2rad(angle_from + i * (angle_to-angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)

	for index_point in range(nb_points):
		draw_line(points_arc[index_point], points_arc[index_point + 1], color)

func draw_circle_arc_poly(center, radius, angle_from, angle_to, color):
	var nb_points = 32
	var points_arc = PoolVector2Array()
	points_arc.push_back(center)
	var colors = PoolColorArray([color])

	for i in range(nb_points + 1):
		var angle_point = deg2rad(angle_from + i * (angle_to - angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
	draw_polygon(points_arc, colors)
		
