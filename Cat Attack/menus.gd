extends Control
onready var anim1 = $start/Node2D
onready var anim2 = $options/Node2D
onready var anim3 = $exit/Node2D

func _ready():
	pass


func _on_start_pressed():
	get_tree().change_scene("res://Actulgamestufff/level1Game.tscn")

func _on_options_pressed():
	get_tree().change_scene("res://options.tscn")

func _on_exit_pressed():
	get_tree().quit()



func _on_options_mouse_entered():
	anim2.visible = true



func _on_exit_mouse_entered():
	anim3.visible = true



func _on_start_mouse_entered():
	anim1.visible = true



func _on_start_mouse_exited():
	anim1.visible = false



func _on_exit_mouse_exited():
	anim3.visible = false




func _on_options_mouse_exited():
	anim2.visible = false


