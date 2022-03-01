extends Node2D

onready var player = get_node("Player")
onready var camera = get_node("Camera2D")
onready var menu = get_node("Menu")
export var levelnum = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	player.position.y = 420
	player.position.x = 64
	
func _process(delta):
	if Input.is_action_just_pressed("open_menu"):
		menu.visible = true
		menu.rect_position = camera.position
		get_tree().paused = true
		
func to_next_level():
	print("res://levels/Level" + str(levelnum + 1) + ".tscn")
	get_tree().change_scene("res://levels/Level" + str(levelnum + 1) + ".tscn")

