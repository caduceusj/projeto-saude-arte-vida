extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$BackGround/VBoxContainer/FeedbackLabel.text = Singleton.feedback


func _on_restart_pressed():
	Singleton.feedback = ""
	SceneTransition.change_scene(Singleton.checkpoint_scene)


func _on_menu_pressed():
	SceneTransition.change_scene("res://Geral/Cenas/menu_geral.tscn")
