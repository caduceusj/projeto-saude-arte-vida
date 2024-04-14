extends Control

var videoLen = 0.0

signal clicked
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	videoLen += delta
	$Label.text = str(int(videoLen))
	pass
