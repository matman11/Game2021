extends Area2D

func _ready():
	$AnimationPlayer.play("coin1")


func _on_coin_body_entered(body):
	if body.name == ("Player"):
			$AnimationPlayer.play("Ctaken")
			yield($AnimationPlayer, "animation_finished")
			queue_free()




