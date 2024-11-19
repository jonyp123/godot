extends Area2D

@export var jump_impulse = 15000
@export var speed = 150
var velocity = Vector2.ZERO

var jump_curve : Curve

var screen_size

var is_jumping
	
func _process(delta):
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	elif Input.is_action_pressed("move_left"):
		velocity.x = -speed
	elif Input.is_action_just_pressed("jump") and is_on_floor():
		print("jump")
		velocity.y = -jump_impulse
	else:
		velocity.x = 0
		if not is_on_floor():
			is_jumping = true
			velocity.y = 50
			position += velocity * delta
		else:
			velocity.y = 0
	position += velocity * delta
		
func is_on_floor() -> bool:
	return $RayCast2D.is_colliding()
