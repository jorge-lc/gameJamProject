extends KinematicBody2D

var run_speed = 350
var jump_speed = -1000
var gravity = 2500
var HP = 5
var velocity = Vector2()
var collition_delay = 400

var damage1 = preload("res://damage1.png")
var damage2 = preload("res://damage2.png")
var damage3 = preload("res://damage3.png")
var damage4 = preload("res://damage4.png")
var dead = preload("res://dead.png")
onready var icon_sprite = get_node("../Player/icon")
var allowDmg = true
signal Game_Over

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
		queue_free()
		emit_signal("Game_Over")
		get_tree().change_scene("res://GameOver.tscn")
	elif Obj.collider.name == "Zombie":
		HP -= 1
		print(HP)
		return HP


func _physics_process(delta):
	velocity.y += gravity * delta
	get_input()
	velocity = move_and_slide(velocity, Vector2(0, -1))
	var collision = move_and_collide(velocity * delta)
	if collision && allowDmg == true:
		hpCounter(collision, HP)
		match HP:
			0:
				icon_sprite.set_texture(dead)
			1:
				icon_sprite.set_texture(damage4)
			2:
				icon_sprite.set_texture(damage3)
			3:
				icon_sprite.set_texture(damage2)
			4:
				icon_sprite.set_texture(damage1)
		allowDmg = false
		yield(get_tree().create_timer(0.3), "timeout")
		allowDmg = true

