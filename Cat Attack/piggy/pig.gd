extends Area2D

var moving = false 
export var SPEED = 50

func _process(delta):
	moving = false 
	if Input.is_action_pressed("ui_left"):
		move(-SPEED, 0, delta, true)
	if Input.is_action_pressed("ui_right"):
		move(SPEED, 0, delta)
	if Input.is_action_pressed("ui_up"):
		move(0,-SPEED, delta)
	if Input.is_action_pressed("ui_down"):
		move(0,SPEED, delta)
	if moving:
		$AnimationPlayer.play("run")
	else:
		$AnimationPlayer.play("idle")
		
	
	
func move(xspeed, yspeed, delta, flip = false):
	position.x += xspeed * delta 
	position.y += yspeed * delta 
	moving = true 
	$pig.flip_h = flip 

func _ready():
	pass
