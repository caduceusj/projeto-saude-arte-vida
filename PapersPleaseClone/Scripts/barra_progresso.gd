extends Control

const MAX_VALUE = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	$ProgressBar.max_value = MAX_VALUE
	$ProgressBar.value = MAX_VALUE
	$LabelTempo.text = str(MAX_VALUE)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if($ProgressBar.value <= 0):
		get_parent().get_node("HUD").emit_signal("gameOver")


func _on_timer_timeout():
	$ProgressBar.value -= 1
	$LabelTempo.text = str($ProgressBar.value)
