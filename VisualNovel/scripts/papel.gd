extends Node2D

signal proximo_caso()

func _ready():
	$ProximoButton.hide()
	
func mostrar_papel():
	var caso_atual = get_parent().caso_atual - 1
	var index = get_parent().casos_sorteados[caso_atual] - 1
	$PapelSprite/RichTextLabel.text = Singleton.casos[index]
	$PapelSprite/RichTextLabel.scroll_to_line(0)
	$AnimationPlayer.play("papel_chegando")

func tirar_papel():
	$AnimationPlayer.play("papel_saindo")

func _on_animation_player_animation_finished(anim_name):
	if (anim_name == "papel_chegando"):
		$ProximoButton.show()
	elif (anim_name == "papel_saindo"):
		$ProximoButton.hide()

func _on_proximo_button_pressed():
	$AnimationPlayer.play('papel_saindo')
	proximo_caso.emit()

