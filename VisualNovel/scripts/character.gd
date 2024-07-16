extends Node2D

signal personagem_chegou()

func personagem_chegando():
	$AnimationPlayer.play('character_enter')
	
func mudar_textura(textura):
	var nova_textura = load(textura)
	$Sprite2D.set_texture(nova_textura)


func _on_animation_player_animation_finished(anim_name):
	if(anim_name == 'character_enter'):
		emit_signal('personagem_chegou')
