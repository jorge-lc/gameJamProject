extends KinematicBody2D

var up = Vector2(0,-1)
var acceleration = 50
var jump_high = -550
var max_speed = 250
var gravity = 10

var HP = 5
var motion = Vector2()

func hit():
	HP -=1
	print(HP)

func _process(delta):
	match HP:
			1:
				$Robie/AnimationPlayer.play("solo torso")
			2:
				$Robie/AnimationPlayer.play("un braz")
			3:
				$Robie/AnimationPlayer.play("dos miembros")
				$parado.disabled = true
				$tirado.disabled = false
			4:
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
