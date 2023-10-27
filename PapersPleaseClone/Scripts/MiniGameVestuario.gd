extends Control

@onready var rubrica = $Rubrica/ColorRect

var aleatorizar = RandomNumberGenerator

var dentroRubrica = false

var adequado = false

var corDoCarimbo
# Called when the node enters the scene tree for the first time.
func _ready():
	aleatorizar = RandomNumberGenerator.new()
	proximoEnfermeiro()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func proximoEnfermeiro():
	adequado = aleatorizar.randi_range(0,1)
	print(adequado)
	if(adequado):
		$Enfermeiro/Sprite2D.frame = 0
	else:
		$Enfermeiro/Sprite2D.frame = aleatorizar.randi_range(1,5)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and dentroRubrica:
		if(corDoCarimbo == "verde"):
			if(adequado):
				proximoEnfermeiro()
				$Feedback/Label.text = "Acertou"
			else:
				proximoEnfermeiro()
				$Feedback/Label.text = "Errou, Kit Inompleto"
		elif(corDoCarimbo == "vermelho"):
			if(adequado == 0):
				proximoEnfermeiro()
				$Feedback/Label.text = "Acertou"
			else:
				proximoEnfermeiro()
				$Feedback/Label.text = "Errou, Kit Completo"
			
func _on_area_2d_area_entered(area):
	if(area.is_in_group("Carimbo")):
		dentroRubrica = true
		corDoCarimbo = area.get_parent().tipo



func _on_area_2d_area_exited(area):
	if(area.is_in_group("Carimbo")):
		dentroRubrica = false
		corDoCarimbo = null
