extends Control


func _ready():
	pass


func _on_Music_db_value_changed(value: float) -> void:
	Globalsounds.music_volume = value
	$"Music 2".text = str(value + 50)
	if value == $"Music_db".min_value:
		Globalsounds.music_enabled = false
	else:
		Globalsounds.music_enabled = true 




func _on_SFX_db_value_changed(value):
	Globalsounds.music_volume = value 
	$"SFX2".text = str(value + 50)
	if value == $"SFX_db".min_value:
		Globalsounds.fx_enabled = false 
	else:
		Globalsounds.fx_enabled = true
	


func _on_Back_pressed():
	get_tree().change_scene("res://menus.tscn")
