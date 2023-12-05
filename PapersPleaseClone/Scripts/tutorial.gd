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
			if(page == 3 or page == 12 or page == 15):
				page += 1
				_checkPage()
		elif(corDoCarimbo == "vermelho"):
			if(page == 6):
				page += 1
				_checkPage()
			if(page == 12 or page == 15):
				$Tablet/Tablet/Label.text = "Você selecionou o carimbo errado para esse caso!, tente novamente"
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
		$Tablet/Pointer.show()
		$Rubrica/Pointer.hide()
	elif(page == 5):
		$Carimbos/Pointer2.show()
		$Tablet/Pointer.hide()
		$Tablet/Tablet/Label.text = "Agora utilize seu Mouse para selecionar o Carimbo de Reprovar, O carimbo de reprovar é o Vermelho ao Lado do Carimbo de Aprovar"
	elif(page == 6):
		$Carimbos/Pointer2.hide()
		$Rubrica/Pointer.show()
		$Tablet/Tablet/Label.text = "Arraste o Carimbo Vermelho para a Rúbrica localizada na parte inferior da interface"
	elif(page == 7):
		$Rubrica/Pointer.hide()
		$Tablet/Pointer.show()
		$Tablet/Tablet/Label.text = "Muito bem! lembrando que você irá somente utilizar esse Carimbo quando a seleção das vestes ou equipamentos NÃO estiver de forma adequada"
	elif(page == 8):
		$Tablet/Tablet/Label.text = "Seu objetivo é realizar a triagem das vestes e dos equipamentos de acordo com um respectivo padrão"
	elif(page == 9):
		$Tablet/Tablet/Label.text = "As informações serão consultadas através desse IPAD que na primeira página haverá um Checklist Auxiliar(Opcional) dos equipamentos ou vestes necessárias"
	elif(page == 10):
		$Tablet/Tablet/Label.text = "E na segunda página uma lista dos Itens presentes em cada kit para ser considerado adequado"
	elif(page == 11):
		$Tablet/Tablet/Label.text = "Esse é um exemplo de um kit de vestuário cirurgico completo, note que todas as peças estão devidamente limpas e organizadas"
		$AnimationPlayer.play("EnfermeiroEntra")
	elif(page == 12):
		$Tablet/Pointer.hide()
		$Tablet/Tablet/Label.text = "Utilize o carimbo de aprovar na rúbrica para o kit de vestuario correto."
	elif(page == 13):
		$Tablet/Pointer.show()
		$AnimationPlayer.play_backwards("EnfermeiroEntra")
		$Tablet/Tablet/Label.text = "Muito bem! isso será essencial para que você consiga superar o Minigame do Vestuario portanto preste atenção nas roupas!"
	elif(page == 14):
		$AnimationPlayer.play("EnfermeiroEntra")
		$Enfermeiro/ColorRect2/TableContainer.show()
		$Enfermeiro/ColorRect2/MesaVestes.hide()
		$Tablet/Tablet/Label.text = "Este é um exemplo de um kit de equipamentos completo, note que todos os equipamentos estão presentes e o Campo Cirurgico está por cima da Mesa de Mayo"
	elif(page == 15):
		$Tablet/Pointer.hide()
		$Tablet/Tablet/Label.text = "Utilize o carimbo de aprovar na rúbrica para o kit de vestuario correto."
	elif(page == 16):
		$Tablet/Pointer.show()
		$Tablet/Tablet/Label.text = "Muito bem! lembrando que qualquer coisa a mais ou a menos do que isso é qualificado como um erro da organização do Kit, portanto se Atente a cada Kit"
	elif(page == 17):
		$Tablet/Tablet/Label.text = "Muito obrigado pelo auxilio Enfermeira! tenha um Bom Dia!"
		$AnimationPlayer.play_backwards("EnfermeiroEntra")
	elif(page == 18):
		$Tablet/Tablet/Label.text = "Com isso você está pronto para iniciar!, Desejo a você um bom trabalho!"
	elif(page == 19):
		get_tree().change_scene_to_file("res://PapersPleaseClone/Cenas/Menu/miniGameMenu.tscn")

func _on_next_page_pressed():
	if(page == 2 or page == 3 or page == 5 or page == 6 or page == 12 or page == 15):
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
		elif event.pressed and page == 5:
			selected = true
			page+=1
			_checkPage()
	
