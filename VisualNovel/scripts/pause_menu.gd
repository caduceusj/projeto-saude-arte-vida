extends CanvasLayer

signal reiniciar_jogo()

func _ready():
	hide()

func _on_continuar_pressed():
	hide()
	get_tree().paused = false


func _on_reiniciar_pressed():
	Singleton.feedback = ""
	hide()
	get_tree().paused = false
	emit_signal("reiniciar_jogo")


func _on_menu_pressed():
	Singleton.feedback = ""
	hide()
	get_tree().paused = false
	SceneTransition.change_scene("res://Geral/Cenas/menu_geral.tscn")
