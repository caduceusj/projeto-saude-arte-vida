extends Control



func _process(delta):
	if($Tutorial.get_child_count() == 0):
		$Button.show()


func _on_button_2_button_down():
	get_tree().change_scene_to_file("res://Mozu/Menu/Menu.tscn")


func _on_button_button_down():
	get_tree().change_scene_to_file("res://Mozu/Cenas/Tutorial/tutorial_2.tscn")
