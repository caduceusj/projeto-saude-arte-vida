extends Control

@onready var gameController = get_node("/root/GameController")
# Called when the node enters the scene tree for the first time.



func _on_button_pressed():
	gameController.mode = 0
	get_tree().change_scene_to_file("res://PapersPleaseClone/Cenas/Tutorial/tutorial.tscn")


func _on_button_2_pressed():
	gameController.mode = 1
	get_tree().change_scene_to_file("res://PapersPleaseClone/Cenas/Fases/Game/game.tscn")


func _on_button_3_pressed():
	gameController.mode = 2
	get_tree().change_scene_to_file("res://PapersPleaseClone/Cenas/Fases/Game/game.tscn")


func _on_button_4_pressed():
	get_tree().change_scene_to_file("res://Geral/Cenas/menu_geral.tscn")
