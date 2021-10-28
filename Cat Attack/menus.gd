extends Control


func _ready():
	pass


func _on_start_pressed():
	get_tree().change_scene("res://Actulgamestufff/level1Game.tscn")


func _on_options_pressed():
	get_tree().change_scene("res://options.tscn")

func _on_exit_pressed():
	get_tree().quit()
