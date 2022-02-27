extends Camera2D

onready var player = get_node("../Player")
export var movement_speed = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	position.y = 300

func _physics_process(delta):
	position.x = lerp(position.x, player.position.x, movement_speed * delta)
