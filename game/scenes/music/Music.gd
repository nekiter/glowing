extends Node2D


var red = Color(1.0, 0.0, 0.0)
var green = Color(0, 1.0, 0.0)
var blue = Color(0.0, 0.0, 1.0)

var shapesArray = ["triangle", "circle", "square"]
var colorsArray = [red, green, blue]

var timestamps = {}

export var transition_duration = 1.00
export var transition_type = 1 # TRANS_SINE

onready var tween_out = get_node("Tween")
onready var tween_in = get_node("FadeIn")

# Called when the node enters the scene tree for the first time.
func _ready():
	reset_audios()

func reset_audios():
	timestamps["red"] = 0
	timestamps["blue"] = 0
	timestamps["green"] = 0
	timestamps["triangle"] = 0
	timestamps["circle"] = 0
	timestamps["square"] = 0
	timestamps["drumbase"] = 0

	# Music nodes
	var DrumBase = get_node("DrumBase")
	var Square = get_node("Square")
	var Triangle = get_node("Triangle")
	var Circle = get_node("Circle")
	var Red = get_node("Red")
	var Green = get_node("Green")
	var Blue = get_node("Blue")
	
	DrumBase.stop()
	Square.stop()
	Triangle.stop()
	Circle.stop()
	Red.stop()
	Green.stop()
	Blue.stop()
	DrumBase.volume_db = -80
	Square.volume_db = -80
	Triangle.volume_db = -80
	Circle.volume_db = -80
	Red.volume_db = -80
	Green.volume_db = -80
	Blue.volume_db = -80


	
func fade_out(stream_player):
	# tween music volume down to 0
	tween_out.interpolate_property(stream_player, "volume_db", 0, -80, transition_duration, transition_type, Tween.EASE_IN, 0)
	tween_out.start()
	# when the tween ends, the music will be stopped

func fade_in(stream_player, seek):
	if !stream_player.playing:
		stream_player.play(seek)
		tween_in.interpolate_property(stream_player, "volume_db", -80, 0, transition_duration, transition_type, Tween.EASE_IN, 0)
		tween_in.start()

func _on_Tween_tween_completed(object, key):
	# stop the music -- otherwise it continues to run at silent volume
	object.stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var currentPlayerInfo = get_node("/root/Game/PlayerSprite")

	shapesArray = currentPlayerInfo.get("shapesArray")
	colorsArray = currentPlayerInfo.get("colorsArray")
	var currentShape = currentPlayerInfo.get("currentShape")
	var currentColor = currentPlayerInfo.get("currentColor")

	# Music nodes
	var DrumBase = get_node("DrumBase")
	var Square = get_node("Square")
	var Triangle = get_node("Triangle")
	var Circle = get_node("Circle")
	var Red = get_node("Red")
	var Green = get_node("Green")
	var Blue = get_node("Blue")

	print("------")
	if DrumBase.playing:
		print("Playing drumbase")
	if Square.playing:
		print("Playing Square")
	if Triangle.playing:
		print("Playing Triangle")
	if Circle.playing:
		print("Playing Circle")
	if Red.playing:
		print("Playing Red")
	if Green.playing:
		print("Playing Green")
	if Blue.playing:
		print("Playing Blue")
	

	if shapesArray[currentShape] == "triangle" and !Triangle.playing:
		timestamps["circle"] = Circle.get_playback_position()
		timestamps["square"] = Square.get_playback_position()
		fade_out(Circle)
		fade_out(Square)
		fade_in(Triangle, timestamps["triangle"])
		fade_in(DrumBase, timestamps["drumbase"])
	elif shapesArray[currentShape] == "circle" and !Circle.playing:
		timestamps["triangle"] = Triangle.get_playback_position()
		timestamps["square"] = Square.get_playback_position()
		fade_in(Circle, timestamps["circle"])
		fade_out(Square)
		fade_out(Triangle)
		fade_in(DrumBase, timestamps["drumbase"])
	elif shapesArray[currentShape] == "square" and !Square.playing:
		timestamps["triangle"] = Triangle.get_playback_position()
		timestamps["circle"] = Square.get_playback_position()
		timestamps["drumbase"] = Triangle.get_playback_position()
		fade_out(Circle)
		fade_in(Square, timestamps["square"])
		fade_out(Triangle)
		fade_out(DrumBase)

	if colorsArray[currentColor] == red and !Red.playing:
		timestamps["blue"] = Blue.get_playback_position()
		timestamps["green"] = Green.get_playback_position()
		fade_in(Red, timestamps["red"])
		fade_out(Blue)
		fade_out(Green)
	elif colorsArray[currentColor] == blue and !Blue.playing:
		timestamps["red"] = Red.get_playback_position()
		timestamps["green"] = Green.get_playback_position()
		fade_in(Blue, timestamps["blue"])
		fade_out(Red)
		fade_out(Green)

	elif colorsArray[currentColor] == green and !Green.playing:
		timestamps["red"] = Red.get_playback_position()
		timestamps["blue"] = Blue.get_playback_position()
		fade_out(Red)
		fade_out(Blue)
		fade_in(Green, timestamps["green"])


