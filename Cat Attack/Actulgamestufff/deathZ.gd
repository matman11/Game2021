extends Area2D


func _ready():
	pass
	
func _on_deathZ_body_entered(body):
	if body.name == ("Player"):
		get_tree().reload_current_scene()
