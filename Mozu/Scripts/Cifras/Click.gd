extends TextureButton
var tween
var tween2
var hasPressed = false

func _process(delta):
	if(hasPressed):
		$Sprite2D.position.y -= delta
		



func _on_button_down():
	self.self_modulate = Color(1,1,1,0)
	hasPressed = true
	tween = create_tween()
	tween2 = create_tween()
	tween2.tween_property($Sprite2D, "modulate", Color(1,1,1,0), 0.5)
	tween.tween_property($Sprite2D, "scale", Vector2(4,4), 0.5)
	await(get_tree().create_timer(0.5).timeout)
	get_parent().queue_free()
