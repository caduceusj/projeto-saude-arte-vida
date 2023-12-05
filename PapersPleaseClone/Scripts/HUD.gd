extends CanvasLayer

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
