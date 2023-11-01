extends Control

@onready var rubrica = $Rubrica/ColorRect
@export var dialogos : Resource
var aleatorizar = RandomNumberGenerator

var dentroRubrica = false

var resposta = 0

var adequado = false

var corDoCarimbo
# Called when the node enters the scene tree for the first time.
func _ready():
	aleatorizar = RandomNumberGenerator.new()
	proximoEnfermeiro()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
	

func proximoEnfermeiro():
	$AnimationPlayer.play("NurseLeaving")
	await($AnimationPlayer.animation_finished)
	resposta = aleatorizar.randi_range(0, dialogos.enfermeiroDialogosEntrada.size()-1)
	set_text(dialogos.enfermeiroDialogosEntrada[resposta])
	adequado = aleatorizar.randi_range(0,1)
	print(adequado)
	if(adequado):
		$Enfermeiro/Sprite2D.frame = 0
	else:
		$Enfermeiro/Sprite2D.frame = aleatorizar.randi_range(1,5)
		print($Enfermeiro/Sprite2D.frame)
	
	$AnimationPlayer.play("NurseComing")
	await($AnimationPlayer.animation_finished)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and dentroRubrica:
		if(corDoCarimbo == "verde"):
			if(adequado):
				proximoEnfermeiro()
				$Feedback/Label.text = "Acertou"
				set_text(dialogos.enfermeiroDialogoSaidaCorreto[resposta])
			else:
				proximoEnfermeiro()
				set_text(dialogos.enfermeiroDialogoSaidaCorreto[resposta])
				$Feedback/Label.text = "Errou, Kit Inompleto"
		elif(corDoCarimbo == "vermelho"):
			if(adequado == 0):
				proximoEnfermeiro()
				set_text(dialogos.enfermeiroDialogoSaidaErrado[resposta])
				$Feedback/Label.text = "Acertou"
			else:
				proximoEnfermeiro()
				set_text(dialogos.enfermeiroDialogoSaidaErrado[resposta])
				$Feedback/Label.text = "Errou, Kit Completo"
			
func _on_area_2d_area_entered(area):
	if(area.is_in_group("Carimbo")):
		dentroRubrica = true
		corDoCarimbo = area.get_parent().tipo


func set_text(text):
	$Dialogo/Panel/Label.text = text 

func _on_area_2d_area_exited(area):
	if(area.is_in_group("Carimbo")):
		dentroRubrica = false
		corDoCarimbo = null
