extends Area2D


func _ready():
	pass
	

func _on_death2_body_entered(body):
	if body.name == ("Player"):
		get_tree().change_scene("res://deathscreen.tscn")
