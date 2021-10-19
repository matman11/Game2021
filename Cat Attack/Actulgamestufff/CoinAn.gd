extends Area2D

func _ready():
	$AnimationPlayer.play("coin1")

signal coin_collected

func _on_coin_body_entered(body):
	if body.name == ("Player"):
		emit_signal("coin_collected")
		$AnimationPlayer.play("Ctaken")
		yield($AnimationPlayer, "animation_finished")
		

			







