extends Node2D


@onready var aleatorizar : RandomNumberGenerator



signal tableChange
var equipAux
var equipAux2
var adequado
var missing = ""
var utensiliosMedicos = ["cateterfr", "clorexedinaAlcoolica", "compressaEsteril", "curativoTransparente", "equipoParaoSoro", "fitaMetricaEsteril", "Garrote", "IntrodutoreBizel", "pincaAnatomica", "pincaAntisepssiaDaPele", "Seringa", "soroFisiologico", "tesouraDeMayo"]
var utensiliosMedicosBase = ["cateterfr", "clorexedinaAlcoolica", "compressaEsteril", "curativoTransparente", "equipoParaoSoro", "fitaMetricaEsteril", "Garrote", "IntrodutoreBizel", "pincaAnatomica", "pincaAntisepssiaDaPele", "Seringa", "soroFisiologico", "tesouraDeMayo"]
# Called when the node enters the scene tree for the first time.

func inicializarMesa():
	aleatorizar = RandomNumberGenerator.new()
	adequado = aleatorizar.randi_range(0,2)
	print(adequado)
	if(adequado == 1):
		print("enter")
		$CampoCirurgico.show()
		for x in utensiliosMedicos.size():
			equipAux = aleatorizar.randi_range(0, utensiliosMedicos.size()-1)
			get_node("Equipamentos/Sprite"+str(x)).texture = load("res://PapersPleaseClone/Sprites/Equipamentos/"+utensiliosMedicos[equipAux]+".png")
			utensiliosMedicos.remove_at(equipAux)
	elif(adequado == 0 or adequado == 2):
		var variacao = aleatorizar.randi_range(0,2)
		if(variacao == 0):
			$CampoCirurgico.show()
			var y = aleatorizar.randi_range(2, utensiliosMedicos.size()-2)
			#Realiza uma geração quase correta mas coloca uma duplicata no lugar de UM equipamento
			var fakeDouble = utensiliosMedicos[aleatorizar.randi_range(0, utensiliosMedicos.size()-1)]
			for x in utensiliosMedicos.size():
				equipAux = aleatorizar.randi_range(0, utensiliosMedicos.size()-1)
				get_node("Equipamentos/Sprite"+str(x)).texture = load("res://PapersPleaseClone/Sprites/Equipamentos/"+utensiliosMedicos[equipAux]+".png")
				utensiliosMedicos.remove_at(equipAux)
			if(str(get_node("Equipamentos/Sprite"+str(y)).texture.resource_path) != "res://PapersPleaseClone/Sprites/Equipamentos/"+fakeDouble+".png"):
				get_node("Equipamentos/Sprite"+str(y)).texture= load("res://PapersPleaseClone/Sprites/Equipamentos/"+fakeDouble+".png")
			else:
				get_node("Equipamentos/Sprite"+str(y+1)).texture= load("res://PapersPleaseClone/Sprites/Equipamentos/"+fakeDouble+".png")
			missing = "Dois do mesmo equipamento"
		elif(variacao == 1):
			$CampoCirurgico.show()
			#Realiza uma geração de forma completamente caótica
			for x in utensiliosMedicos.size():
				equipAux = aleatorizar.randi_range(0, utensiliosMedicos.size()-1)
				get_node("Equipamentos/Sprite"+str(x)).texture = load("res://PapersPleaseClone/Sprites/Equipamentos/"+utensiliosMedicos[equipAux]+".png")
			missing = "Multiplos Equipamentos Ausentes"
		elif(variacao == 2):
			$CampoCirurgico.hide()
			for x in utensiliosMedicos.size():
				equipAux = aleatorizar.randi_range(0, utensiliosMedicos.size()-1)
				get_node("Equipamentos/Sprite"+str(x)).texture = load("res://PapersPleaseClone/Sprites/Equipamentos/"+utensiliosMedicos[equipAux]+".png")
				utensiliosMedicos.remove_at(equipAux)
			missing = "Campo Cirugico Ausente"
	utensiliosMedicos = ["cateterfr", "clorexedinaAlcoolica", "compressaEsteril", "curativoTransparente", "equipoParaoSoro", "fitaMetricaEsteril", "Garrote", "IntrodutoreBizel", "pincaAnatomica", "pincaAntisepssiaDaPele", "Seringa", "soroFisiologico", "tesouraDeMayo"]
func _on_table_change():
	print("emit")
	
	inicializarMesa()
