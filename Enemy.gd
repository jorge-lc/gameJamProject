extends KinematicBody2D

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
	
