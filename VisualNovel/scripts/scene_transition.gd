extends CanvasLayer

var nova_cena = ""

func _ready():
	fade_out_animation()

func change_scene(cena):
	nova_cena = cena
	fade_in_animation()

func fade_in_animation():
	$AnimationPlayer.play('fade_in')


func fade_out_animation():
	$AnimationPlayer.play('fade_out')


func _on_animation_player_animation_finished(anim_name):
	if(anim_name == 'fade_in'):
		if(nova_cena != ""):
			get_tree().change_scene_to_file(nova_cena)
			nova_cena = ""
		fade_out_animation()
