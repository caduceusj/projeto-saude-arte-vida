extends Node2D


@onready var aleatorizar : RandomNumberGenerator
var trajes = ["camisa" , "luvas", "mask", "touca"]
var trajeAux
var adequado
var missing
signal tableChange
# Called when the node enters the scene tree for the first time.


func inicializarMesa():
	print("entrou")
	aleatorizar = RandomNumberGenerator.new()
	adequado = aleatorizar.randi_range(0,3)
	if(adequado == 1):
		for x in trajes.size():
			trajeAux = aleatorizar.randi_range(0, trajes.size()-1)
			get_node("Roupas/Sprite"+str(x)).texture = load("res://PapersPleaseClone/Sprites/vestuarioTeste/"+trajes[trajeAux]+".png")
			get_node("Roupas/Sprite"+str(x)).frame = 0
			trajes.remove_at(trajeAux)
	elif(adequado == 0):
		for x in  trajes.size():
			trajeAux = aleatorizar.randi_range(0, trajes.size()-1)
			get_node("Roupas/Sprite"+str(x)).texture = load("res://PapersPleaseClone/Sprites/vestuarioTeste/"+trajes[trajeAux]+".png")
			get_node("Roupas/Sprite"+str(x)).frame = 1
			missing = "Roupas Sujas"
			trajes.remove_at(trajeAux)
	elif(adequado == 2):
		for x in  trajes.size():
			trajeAux = aleatorizar.randi_range(0, trajes.size()-1)
			get_node("Roupas/Sprite"+str(x)).texture = load("res://PapersPleaseClone/Sprites/vestuarioTeste/"+trajes[trajeAux]+".png")
			get_node("Roupas/Sprite"+str(x)).frame = 2
			missing = "Roupas Rasgadas"
			trajes.remove_at(trajeAux)
	elif(adequado == 3):
		for x in  trajes.size():
			trajeAux = aleatorizar.randi_range(0, trajes.size()-1)
			get_node("Roupas/Sprite"+str(x)).texture = load("res://PapersPleaseClone/Sprites/vestuarioTeste/"+trajes[trajeAux]+".png")
			get_node("Roupas/Sprite"+str(x)).frame = 0
			trajes.remove_at(trajeAux)
		get_node("Roupas/Sprite"+str(aleatorizar.randi_range(0,3))).frame = aleatorizar.randi_range(1,2)
		missing = "Uma Peça Incorreta"
	trajes = ["camisa" , "luvas", "mask", "touca"]

func _on_table_change():
	print("emit")
	
	inicializarMesa()

