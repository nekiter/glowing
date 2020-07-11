extends Node2D

export var scroll_speed = 1

func _ready():
	pass # Replace with function body.

func move(speed = scroll_speed):
	self.position.x-=speed
