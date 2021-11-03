extends KinematicBody2D
var velocity = Vector2()
export var direction = -1
 






func _physics_process(_delta):
	if is_on_floor():
		$AnimationPlayer.play("slide")
	if is_on_wall():
		direction = direction * -1
		if direction == 1:
			$Sprite.flip_h = true 
		if direction == -1:
			$Sprite.flip_h = false
	
	velocity.y += 20
	
	velocity.x = 50 * direction
	
	velocity = move_and_slide(velocity, Vector2.UP)
	


func _on_hurtbox_body_entered(body):
	if body.name == "Player":
		$AnimationPlayer.play("death")




func _on_damagedeal_area_entered(area):
	$AnimationPlayer.play("attck")
