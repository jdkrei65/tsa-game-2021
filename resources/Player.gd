extends KinematicBody2D


export var speed = 150
export var gravity = 25
export var jump_power = 530
var velocity = Vector2(0, 0)

onready var sprite = get_node("Sprite")
onready var tilemap = get_node("../TileMap")
onready var levelnode = get_node("..")

const Tiles = {
	CACTUS = 0,
	SPIKES = 12,
	FINISH = 13
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
		get_node("Sprite").set_flip_h(false)
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
		get_node("Sprite").set_flip_h(true)
	
	if abs(velocity.x) < speed / 8:
		sprite.playing = false
		sprite.frame = 0
	else:
		sprite.playing = true
	
	velocity.y += gravity
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = -jump_power
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.x = lerp(velocity.x, 0, 0.1)
	
	if position.y > 600:
		die()
	
	var pos_on_map = tilemap.world_to_map(position*2)
	var tile = tilemap.get_cellv(pos_on_map)
	if tile == Tiles.FINISH:
		print("Finish")
		levelnode.to_next_level()
	
	var pos_below = pos_on_map
	pos_below.y += 1
	var tile_below = tilemap.get_cellv(pos_below)
	print(pos_below, tile_below)
	if tile_below == Tiles.SPIKES:
		die()
		
func die():
	get_tree().change_scene("res://Death.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
