extends Node2D

@onready var angle_label = $AngleLabel
@onready var bisel = $AngleTexture/Bisel
@onready var bisel_animation = $BiselAnimation

var direction = -1

signal angle_game_finish()
signal game_over()

func _on_timer_timeout():
	if bisel.rotation_degrees >= 0:
		direction = -1
	elif bisel.rotation_degrees <= -45:
		direction = 1
	
	bisel.rotation_degrees += direction


func _on_button_pressed():
	var current_rotation = bisel.rotation_degrees
	
	if current_rotation <= -10 and current_rotation >= -20:
		angle_label.text = 'Angulação correta!'
	else:
		angle_label.text = 'Angulação incorreta!'
		Singleton.feedback = 'A inserção deve ser em um ângulo de aproximadamente 15º!'
		game_over.emit()
		
	
	$Button.disabled = true
	$Timer.stop()
	
	#Bisel Animation
	bisel_animation.show()
	$AngleTexture.hide()
	await get_tree().create_timer(0.6).timeout
	bisel_animation.play('default')
	


func _on_bisel_animation_animation_finished():
	angle_game_finish.emit()
