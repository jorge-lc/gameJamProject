extends KinematicBody2D

var run_speed = 350
var jump_speed = -1000
var gravity = 2500
var HP = 5
var velocity = Vector2()

var damage1 = preload("res://damage1.png")
var damage2 = preload("res://damage2.png")	
var damage3 = preload("res://damage3.png")	
var damage4 = preload("res://damage4.png")	
var images = Array([damage1, damage2, damage3, damage4])
onready var icon_sprite = get_node("../Player/icon")

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
		
func hpCounter(Obj, Hp):
	if Hp == 0:
		print("Game Over")
	elif Obj.collider.name == "Enemy":
		HP -= 1
		print(HP)
		return HP

func _physics_process(delta):
	velocity.y += gravity * delta
	get_input()
	velocity = move_and_slide(velocity, Vector2(0, -1))
	var collision = move_and_collide(velocity * delta)
	if collision:
		hpCounter(collision, HP)
		match HP:
			1:
				icon_sprite.set_texture(damage4)
			2:
				icon_sprite.set_texture(damage3)
			3:
				icon_sprite.set_texture(damage2)
			4:
				icon_sprite.set_texture(damage1)
		
