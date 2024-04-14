extends HScrollBar

var hasPressed = false





func _process(delta):
	if(value == max_value):
		hasPressed = true
		$AnimationPlayer.play("Drag")
		await($AnimationPlayer.animation_finished)
		get_parent().queue_free()
	if(hasPressed):
		$Sprite2D.position.y += delta
