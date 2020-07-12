extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

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

	points_arc.push_back(Vector2(center.x - width/2, center.y + width/2))
	points_arc.push_back(Vector2(center.x + width/2, center.y + width/2))
	points_arc.push_back(Vector2(center.x, center.y - cos(deg2rad(60))*width/2))

	for index_point in range(points_arc.size()-1):
		draw_line(points_arc[index_point], points_arc[index_point + 1], color)

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
		