extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const MAXFALLSPEED = 200
const MAXSPEED = 150
const JUMPFORCE = 325
var health = 2
var jumpcount = 0
var motion = Vector2()
var facing_right = true
var walljump = 500
var jumpwall = 70
var attacking = false
var dashatt = 250
func _ready():
	pass 

func _physics_process(_delta):
	
	

	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if facing_right == true:
		$Sprite.scale.x = 1
	else:
		$Sprite.scale.x = -1
		
	
	

		
		
	
		
		
	if Input.is_action_pressed("rightclick"):
		$AnimationPlayer.play("attack2")
		
																												
			
	if Input.is_action_pressed("right") and Input.is_action_pressed("rightclick"):
		motion.x = -dashatt
		facing_right == true
	if Input.is_action_pressed("left") and Input.is_action_just_pressed("rightclick"):
		motion.x = dashatt
		facing_right == false


	if Input.is_action_pressed("right") and not Input.is_action_pressed("rightclick"):
		motion.x = MAXSPEED
		facing_right = true 
		$AnimationPlayer.play("run")
	elif Input.is_action_pressed("left") and not Input.is_action_pressed("rightclick"):
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
		
	melee()
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
		


func melee():
	if Input.is_action_just_pressed("leftclick"):
		var checkenemy = $Sprite/swordhit.get_overlapping_bodies()
		attacking = true
		print("attacking")
		for slime in checkenemy:
			if slime.is_in_group("hurtbox"):
				print("dead")
				slime.queue_free()
				
				
		attacking = false
				
				
				
				
	
