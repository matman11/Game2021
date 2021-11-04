extends Control




func _on_Playagain_pressed():
	get_tree().change_scene("res://menus.tscn")


func _on_Quit_pressed():
	print("Cringe")
	get_tree().quit()
