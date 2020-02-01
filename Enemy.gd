extends KinematicBody2D

onready var player = get_node("../Player")
onready var enemy = get_node("../Enemy")
var velocity = Vector2()
var speed = 10000


func _process(_delta):
	if player.position.x > position.x:
		velocity.x += speed
	if player.position.x < position.x:
		velocity.x -= speed
	
func _physics_process(delta):
	velocity = move_and_slide(velocity * delta)



