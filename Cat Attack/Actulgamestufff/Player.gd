extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const MAXFALLSPEED = 200

const JUMPFORCE = 325
var health = 2
var MAXSPEED = 150
var jumpcount = 0
onready var motion = Vector2()
var facing_right = true
var walljump = 500
var jumpwall = 70
var attacking = false
var dashdirection = Vector2(1, 0)
onready var candash = true 
var dashing = false

func _ready():
	pass 

func _physics_process(_delta):
	if is_on_floor():
		candash = true
	dash()
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if facing_right == true:
		$Sprite.scale.x = 1
	else:
		facing_right = false
		$Sprite.scale.x = -1

	if Input.is_action_pressed("right"):
		motion.x = MAXSPEED
		facing_right = true 
		$AnimationPlayer.play("run")
		
	elif Input.is_action_pressed("left"):
		motion.x = -MAXSPEED
		facing_right = false
		$AnimationPlayer.play("run")
	else:
		motion.x = 0 
		$AnimationPlayer.play("idle")
	
	if Input.is_action_just_pressed("jump") and jumpcount <2:
		motion.y = -JUMPFORCE
		jumpcount += 1
		if not is_on_floor() and nextToRightWall():
			motion.x -= walljump
			motion.y -= jumpwall
			
		if not is_on_floor() and nextToLeftWall():
			motion.x += walljump
			motion.y -= jumpwall
	if is_on_floor() or nextToWall():
		jumpcount = 1
	
			
	
	if !is_on_floor():
		if motion.y < 0:
			$AnimationPlayer.play("jump")
		elif motion.y > 0:
			$AnimationPlayer.play("falling")
		
	
	motion = move_and_slide(motion, UP)
	
func nextToWall():
	return nextToRightWall() or nextToLeftWall()

func nextToRightWall():
	return $rightwall.is_colliding()

func nextToLeftWall():
	return $leftwall.is_colliding()
	



func _on_hitbox_body_entered(body):
	if body.name == ("Slime"):
		health -= 1 
		print(health)
		
	if body.name == ("Slime") and health == 0:
		get_tree().reload_current_scene()
		



func dash():
	if Input.is_action_just_pressed("rightclick") and candash:
		
		$Sprite/swordhit/WeaponAni.play("Dashattack")
	
		MAXSPEED = 450
		candash = false
		dashing = true
		
		yield(get_tree().create_timer(0.15), "timeout")
		dashing = false
		MAXSPEED = 150





