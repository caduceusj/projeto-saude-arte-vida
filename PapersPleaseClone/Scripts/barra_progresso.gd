extends Control

const MAX_VALUE = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	$ProgressBar.max_value = MAX_VALUE
	$ProgressBar.value = MAX_VALUE
	$LabelTempo.text = str(MAX_VALUE)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	$ProgressBar.value -= 1
	$LabelTempo.text = str($ProgressBar.value)
