extends Node2D
var pag = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = str(pag)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _trocarPagina(lado):
	if(lado == 'direita'):
		pag += 2
		$Label.text = str(pag)
	else:
		if(pag == 2):
			pass
		else:
			pag -= 2
			$Label.text = str(pag)

func _on_area_2_ddireita_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			_trocarPagina('direita')


func _on_area_2_desquerda_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			_trocarPagina('esquerda')
