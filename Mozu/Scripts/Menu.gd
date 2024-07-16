extends Control




func _on_tutorial_button_down():
	get_tree().change_scene_to_file("res://Mozu/Cenas/Tutorial/tutorial.tscn")


func _on_iniciar_button_down():
	get_tree().change_scene_to_file("res://Mozu/Cenas/CenasDasMãos/ligaTorneira.tscn")


func _on_menu_principal_button_down():
	get_tree().change_scene_to_file("res://Geral/Cenas/menu_geral.tscn")
