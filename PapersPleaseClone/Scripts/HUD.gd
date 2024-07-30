extends CanvasLayer

signal gameOver

var pontuacao = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _alterarPontuacao(pontos):
	pontuacao += pontos;
	$LabelPontos.text = str(pontuacao)


func _on_botao_pause_pressed():
	get_tree().paused = true
	$Panel.show()


func _on_continuar_pressed():
	get_tree().paused = false
	$Panel.hide()


func _on_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://PapersPleaseClone/Cenas/Menu/miniGameMenu.tscn")


func _on_game_over():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	get_tree().paused = true
	$BotaoPause.hide()
	$Panel.hide()
	$EndgameScreen.show()
	$EndgameScreen/VBoxContainer/Continuar.hide()
	if(pontuacao >= 30):
		$EndgameScreen/Text.text = "Ótimo Trabalho !"
		$EndgameScreen/Label.text = "Você executou corretamente a parte da Paramentação e obteve a pontuação de " +str(pontuacao)+ " pontos"
		if GameController.continuos_mode:
			$EndgameScreen/VBoxContainer/Continuar.show()
	elif(pontuacao < 30):
		$EndgameScreen/Text.text = "Você Pode Melhorar!"
		$EndgameScreen/Label.text = "Você pode fazer melhor! sua pontuação foi de apenas  " +str(pontuacao)+ " pontos, tente novamente!"


func _on_endgame_continuar_pressed():
	get_tree().paused = false
	if GameController.mode == 1:
		GameController.mode = 2
		get_tree().reload_current_scene()
	elif GameController.mode == 2:
		Singleton.dialogue_checkpoint = "chamada_mozu"
		get_tree().change_scene_to_file("res://VisualNovel/cenas/visual_novel.tscn")
