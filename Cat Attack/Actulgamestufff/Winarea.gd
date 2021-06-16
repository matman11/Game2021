extends Area2D


func _ready():
	pass


func _on_Winarea_body_entered(body):
	if body.name == ("Player"):
		get_tree().change_scene_to(res://level2,tscn)
