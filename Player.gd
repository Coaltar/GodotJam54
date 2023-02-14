extends KinematicBody2D


export var speed = 420
export var jump_impulse = 250
#export var accel = 50
var velocity = Vector2.ZERO
const GRAVITY = 250.0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	animate_player()
	pass

func get_dir():
	var dir = Vector2.ZERO
	if(Input.is_action_pressed("move_left")):
		dir.x -= 1
	if(Input.is_action_pressed("move_right")):
		dir.x += 1
	return dir.normalized()

func animate_player():
	if(velocity.x > 0):
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.play()
	elif(velocity.x < 0):
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.play()
	else :
		$AnimatedSprite.animation = "stand"
		$AnimatedSprite.play()
	
func _physics_process(delta):
	
	if(is_on_floor()):
		if(Input.is_action_just_pressed("jump")):
			velocity.y = 0
			velocity.y -= jump_impulse
	else:
		velocity.y += delta * GRAVITY
		
	var dir = get_dir()
	velocity.x = (dir * speed).x
	move_and_slide(velocity, Vector2(0,-1))
	pass
	#move_and_slide_with_snap()
	#position.x += velocity.x
	#position = move_and_slide(velocity, Vector2(0,-1))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
