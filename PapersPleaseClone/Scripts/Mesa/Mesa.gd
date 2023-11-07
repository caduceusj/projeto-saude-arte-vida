extends Node2D


@onready var aleatorizar : RandomNumberGenerator

signal tableChange
var equipAux
var equipAux2
var adequado
var utensiliosMedicos = ["cateterfr", "clorexedinaAlcoolica", "compressaEsteril", "curativoTransparente", "equipoParaoSoro", "fitaMetricaEsteril", "Garrote", "IntrodutoreBizel", "pincaAnatomica", "pincaAntisepssiaDaPele", "Seringa", "soroFisiologico", "tesouraDeMayo"]
var utensiliosMedicosBase = ["cateterfr", "clorexedinaAlcoolica", "compressaEsteril", "curativoTransparente", "equipoParaoSoro", "fitaMetricaEsteril", "Garrote", "IntrodutoreBizel", "pincaAnatomica", "pincaAntisepssiaDaPele", "Seringa", "soroFisiologico", "tesouraDeMayo"]
# Called when the node enters the scene tree for the first time.

func inicializarMesa():
	aleatorizar = RandomNumberGenerator.new()
	adequado = aleatorizar.randi_range(0,2)
	print(adequado)
	if(adequado == 1):
		print("enter")
		for x in utensiliosMedicos.size()-1:
			equipAux = aleatorizar.randi_range(0, utensiliosMedicos.size()-1)
			get_node("Equipamentos/Sprite"+str(x+1)).texture = load("res://PapersPleaseClone/Sprites/Equipamentos/"+utensiliosMedicos[equipAux]+".png")
			utensiliosMedicos.remove_at(equipAux)
	elif(adequado == 0 or adequado == 2):
		var variacao = aleatorizar.randi_range(0,1)
		if(variacao == 0):
			for x in utensiliosMedicos.size()-2:
				equipAux = aleatorizar.randi_range(0, utensiliosMedicos.size()-1)
				get_node("Equipamentos/Sprite"+str(x+1)).texture = load("res://PapersPleaseClone/Sprites/Equipamentos/"+utensiliosMedicos[equipAux]+".png")
				utensiliosMedicos.remove_at(equipAux)
		elif(variacao == 1):
			for x in utensiliosMedicos.size()-1:
				equipAux = aleatorizar.randi_range(0, utensiliosMedicos.size()-2)
				get_node("Equipamentos/Sprite"+str(x+1)).texture = load("res://PapersPleaseClone/Sprites/Equipamentos/"+utensiliosMedicos[equipAux]+".png")
			get_node("Equipamentos/Sprite12").texture = load("res://PapersPleaseClone/Sprites/Equipamentos/"+utensiliosMedicos[0]+".png")
		utensiliosMedicos = ["cateterfr", "clorexedinaAlcoolica", "compressaEsteril", "curativoTransparente", "equipoParaoSoro", "fitaMetricaEsteril", "Garrote", "IntrodutoreBizel", "pincaAnatomica", "pincaAntisepssiaDaPele", "Seringa", "soroFisiologico", "tesouraDeMayo"]
func _on_table_change():
	print("emit")
	inicializarMesa()
