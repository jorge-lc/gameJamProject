extends KinematicBody2D

<<<<<<< HEAD
var vel = Vector2(0,0)

onready var Player = get_node("../Player")

var grav = 1800
var max_grav = 3000

var react_time = 400
var dir = 0
var next_dir = 0
var next_dir_time = 0

func _ready():
	set_process(true)
	
func set_dir(target_dir):
	if next_dir != target_dir:
		next_dir = target_dir
		next_dir_time = OS.get_ticks_msec() + react_time

func _process(delta):
	if Player.position.x < position.x - 60 :
		set_dir(-1)
	elif Player.position.x > position.x + 60 :
		set_dir(1)
	else:
		set_dir(0)
		
	if OS.get_ticks_msec() > next_dir_time:
		dir = next_dir
		
	vel.x = dir * 500
		
	vel.y += grav * delta;
	if vel.y > max_grav:
		vel.y = max_grav
	
	if is_on_floor() and vel.y > 0:
		vel.y = 0
=======
var velocity = Vector2()

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision: 
		if collision.collider.has_method("hit"):
			collision.collider.hit()
#onready var player = get_node("../Player")
#onready var enemy = get_node("../Enemy")
#var velocity = Vector2()
#var speed = 1000


#func _process(delta):
	#if player.position.x > position.x:
	#	velocity.x += speed
	#if player.position.x < position.x:
	#	velocity.x -= speed
	#var collision = move_and_collide(velocity * delta)
	#if collision:
	#	if collision.collider.name == "Player":
	#		var reflect = collision.remainder.bounce(collision.normal)
	#		velocity = velocity.bounce(collision.normal)
	#		move_and_collide(reflect)
	
#func _physics_process(delta):
#	velocity = move_and_slide(velocity * delta)
>>>>>>> 0f68f10fef46e50e2be98f3b0be9e648c23e5f7d
	
	vel = move_and_slide(vel, Vector2(0, -1))
