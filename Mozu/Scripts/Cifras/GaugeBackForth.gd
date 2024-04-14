extends HScrollBar

var notTouch = true

@export var count = 20


func _process(delta):
	if(value == max_value and notTouch == false):
		notTouch = true
		$AnimationPlayer.play("DragForth")
		await($AnimationPlayer.animation_finished)
	elif(value == min_value and notTouch == false):
		notTouch = true
		$AnimationPlayer.play("DragBack")
		await($AnimationPlayer.animation_finished)
	if(count < 0):
		print("a")
		mouse_filter = Control.MOUSE_FILTER_IGNORE
		$AnimationPlayer.play("DragVanish")
		await($AnimationPlayer.animation_finished)
		queue_free()
	$Label.text = str(count)
	
func _on_scrolling():
	notTouch = false


func _on_animation_player_animation_started(anim_name):
	count -= 1
