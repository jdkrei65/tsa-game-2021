extends KinematicBody2D


export var speed = 150
export var gravity = 25
export var jump_power = 530
var velocity = Vector2(0, 0)

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
		
	velocity.y += gravity
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = -jump_power
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.x = lerp(velocity.x, 0, 0.1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
