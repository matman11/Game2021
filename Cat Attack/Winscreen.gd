extends Control




func _on_Playagain_pressed():
	get_tree().change_scene("res://menus.tscn")


func _on_Exitb_pressed():
	get_tree().quit()
