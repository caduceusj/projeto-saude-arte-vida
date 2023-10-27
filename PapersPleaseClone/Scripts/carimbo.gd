extends Node2D

var selected = false
var mouse_offset = Vector2(0, 0)

@export var tipo = "verde"

func _process(delta):
	if selected:
		scale = Vector2(6,6)
		followMouse()
	else:
		scale = Vector2(5,5)
		

func followMouse():
	position = get_global_mouse_position() + mouse_offset

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and selected == true:
		if event.pressed:
			mouse_offset = position - get_global_mouse_position()
			if(tipo == "verde"):
				position = get_node("/root/vestuario/Carimbos/posicaoVerde").position
			else:
				position = get_node("/root/vestuario/Carimbos/posicaoVermelho").position
			selected = false

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and selected == false:
		if event.pressed:
			mouse_offset = position - get_global_mouse_position()
			selected = true
