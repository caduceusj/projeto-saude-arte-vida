extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _resetCheckBox():
	for x in $ScrollContainer/VBoxContainer.get_child_count():
		get_node("ScrollContainer/VBoxContainer/CheckBox"+str(x+1)).set_pressed_no_signal(false)


