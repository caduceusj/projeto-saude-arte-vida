extends Node2D

var rng = RandomNumberGenerator.new()
var Maes = ['mãe calma', 'mãe raivosa', 'mãe indiferente']
var Sintomas = ['febre', 'distensão abdominal', 'regurgitações amareladas', 
'episódios de hiperglicemia', 'episódios de apneia']

func _ready():
	var rNumber = rng.randi_range(0, 2)
	
	var rNumber1 = rng.randi_range(0, 4)
	
	var rNumber2 = rng.randi_range(0, 4)
	if rNumber2 == rNumber1:
		rNumber2 = rng.randi_range(0, 4)
	
	var rNumber3 = rng.randi_range(0, 4)
	if rNumber3 == rNumber1 or rNumber3 == rNumber2:
		rNumber3 = rng.randi_range(0, 4)
		
	print_debug("Você está lidando com uma " + Maes[rNumber])
	var textoSintomas = 'O bebê apresenta '  + Sintomas[rNumber1] + ', ' + Sintomas[rNumber2] + ' e ' + Sintomas[rNumber3]
	print_debug(textoSintomas)
	
	

