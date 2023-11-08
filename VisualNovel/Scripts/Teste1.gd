extends Node2D

var sintomas = ['Sintoma1', 'Sintoma2', 'Sintoma3', 'Sintoma4', 'Sintoma5']

func _ready():

	var dialogo_inicial = Dialogic.start('SegundoEncontro')
	add_child(dialogo_inicial)
	#dialogo_inicial.connect("timeline_end", 'newDialogue', 0)
	var dialogo_inicial2 = Dialogic.start('PrimeiroEncontro')
	add_child(dialogo_inicial2)

func newDialogue():
	var dialogo_inicial = Dialogic.start('PrimeiroEncontro')
	add_child(dialogo_inicial)
