extends KinematicBody2D

<<<<<<< HEAD
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
=======
var up = Vector2(0,-1)
var acceleration = 50
var jump_high = -550
var max_speed = 250
var gravity = 10
>>>>>>> 0f68f10fef46e50e2be98f3b0be9e648c23e5f7d

var HP = 5
var motion = Vector2()

<<<<<<< HEAD
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
=======
func hit():
	HP -=1
	print(HP)

func _process(delta):
	match HP:
>>>>>>> 0f68f10fef46e50e2be98f3b0be9e648c23e5f7d
			1:
				$Robie/AnimationPlayer.play("solo torso")
			2:
				$Robie/AnimationPlayer.play("un braz")
			3:
				$Robie/AnimationPlayer.play("dos miembros")
				$parado.disabled = true
				$tirado.disabled = false
			4:
<<<<<<< HEAD
				icon_sprite.set_texture(damage1)
		allowDmg = false
		yield(get_tree().create_timer(0.3), "timeout")
		allowDmg = true

=======
				$Robie/AnimationPlayer.play("una pierna")
				$parado.disabled = false
				$tirado.disabled = true
	
func _physics_process(delta):
	motion.y += gravity
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+acceleration, max_speed)
		$Robie.scale.x = 0.25
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - acceleration, -max_speed)
		$Robie.scale.x = -0.25
	else:
		friction = true
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = jump_high
		if friction == true:
			motion.x = lerp(motion.x, 0,0.2)
	else:
		if friction == true:
			motion.x = lerp(motion.x, 0,0.2)
	motion = move_and_slide(motion, up)
>>>>>>> 0f68f10fef46e50e2be98f3b0be9e648c23e5f7d
