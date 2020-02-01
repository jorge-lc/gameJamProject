extends KinematicBody2D

var run_speed = 350
var jump_speed = -1000
var gravity = 2500

var velocity = Vector2()

var damage1 = preload("res://damage1.png")
var damage2 = preload("res://damage2.png")	
var damage3 = preload("res://damage3.png")	
var damage4 = preload("res://damage4.png")	

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('right')
	var left = Input.is_action_pressed('left')
	var jump = Input.is_action_just_pressed('up')

	if is_on_floor() and jump:
		velocity.y = jump_speed
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed

func _physics_process(delta):
	velocity.y += gravity * delta
	get_input()
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.name == "Enemy":
			print(collision.collider.name)
			var icon_sprite = get_node("../Player/icon")
			icon_sprite.set_texture(damage1)
