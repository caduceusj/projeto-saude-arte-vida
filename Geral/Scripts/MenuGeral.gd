extends Control



func _on_button_button_down():
	SceneTransition.change_scene("res://VisualNovel/cenas/visual_novel.tscn")
	pass # Replace with function body.



func _on_button_2_button_down():
	get_tree().change_scene_to_file("res://Mozu/Menu/Menu.tscn")
	pass # Replace with function body.



func _on_button_3_button_down():
	get_tree().change_scene_to_file("res://PapersPleaseClone/Cenas/Menu/miniGameMenu.tscn")
	pass # Replace with function body.


func _on_button_4_button_down():
	#Procedure Minigame
	pass

func _on_button_5_button_down():
	get_tree().quit()
