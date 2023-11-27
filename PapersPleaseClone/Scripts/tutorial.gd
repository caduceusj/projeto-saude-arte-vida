extends Control
var page = 0
var selected = false
var dentroRubrica = false
var corDoCarimbo
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and dentroRubrica:
		if(corDoCarimbo == "verde"):
			if(page == 3):
				page += 1
				_checkPage()
		elif(corDoCarimbo == "vermelho"):
			pass

func _checkPage():
	if(page == 1):
		$Tablet/Tablet/Label.text = "Você possui dois carimbos em suas mãos e uma rúbrica e seu objetivo é julgar correto ou incorreto os Kits Cirurgicos dos Enfermeiros"
	elif(page == 2):
		$Tablet/Tablet/Label.text = "Utilize seu Mouse para clicar no Carimbo de Aprovar, O carimbo de aprovar é o Verde localizado no Canto Inferior esquerdo da Tela"
		$Tablet/Pointer.hide()
		$Carimbos/Pointer.show()
	elif(page == 3):
		$Rubrica/Pointer.show()
		$Carimbos/Pointer.hide()
		$Tablet/Tablet/Label.text = "Arraste o Carimbo Verde para a Rúbrica localizada na parte inferior da interface"
	elif(page == 4):
		$Tablet/Tablet/Label.text = "Muito bem! lembrando que você irá somente utilizar esse Carimbo quando a seleção das vestes ou equipamentos estiver de forma adequada"
func _on_next_page_pressed():
	if(page == 2 or page == 3):
		pass
	else:
		page+=1
		_checkPage()



func _on_area_2d_area_entered(area):
	dentroRubrica = true
	corDoCarimbo = area.get_parent().tipo

func _on_area_2d_area_exited(area):
	dentroRubrica = false
	corDoCarimbo = null


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and selected == false:
		if event.pressed and page == 2:
			selected = true
			page+=1
			_checkPage()
