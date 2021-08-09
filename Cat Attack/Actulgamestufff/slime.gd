extends KinematicBody2D
var velocity = Vector2()
export var direction = -1
 


func _ready():
	$AnimationPlayer.play("idle")


	
	
func _physics_process(_delta):
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
	if body.name == "player":
		$AnimationPlayer.play("death")
