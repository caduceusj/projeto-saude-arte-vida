extends Control

@onready var feedback = preload("res://PapersPleaseClone/Cenas/FeedbackPopUp/feedback.tscn")
@onready var gameController = get_node("/root/GameController")
@onready var rubrica = $Rubrica/Rubrica
@export var dialogos : Resource
@export var table : Node2D
@export var Tablet : Node2D

var antiDoubleTap = false

var aleatorizar = RandomNumberGenerator

var dentroRubrica = false

var resposta = 0

var adequado = false

var corDoCarimbo
# Called when the node enters the scene tree for the first time.
func _ready():
	if(gameController.mode == 0):
		table = $Enfermeiro/ColorRect2/TableContainer
	elif(gameController.mode == 1):
		
		table = $Enfermeiro/ColorRect2/MesaVestes
		$Enfermeiro/ColorRect2/MesaVestes.show()
		$Enfermeiro/ColorRect2/TableContainer.hide()
		$Tablet/Tablet2.show()
		$Tablet/Tablet.hide()
	elif(gameController.mode == 2):
		$Tablet/Tablet.show()
		$Tablet/Tablet2.hide()
		table = $Enfermeiro/ColorRect2/TableContainer
		$Enfermeiro/ColorRect2/TableContainer.show()
		$Enfermeiro/ColorRect2/MesaVestes.hide()
	table.emit_signal("tableChange")
	
	if(gameController.mode == 1):
		$AnimationPlayer.play("EnfermeiroEntraVestes")
	else:
		$AnimationPlayer.play("EnfermeiroEntra")


func _input(event):

	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and dentroRubrica and antiDoubleTap == false:
		antiDoubleTap = true
		if(corDoCarimbo == "verde"):
			if(table.adequado == 1):
				print("1")
				var feedbackInstance = feedback.instantiate()
				feedbackInstance.text = "Acertou"
				$HUD._alterarPontuacao(10)
				feedbackInstance.position = Vector2(232, 32)
				get_node("/root").add_child(feedbackInstance)
				
			else:
				print("2")
				var feedbackInstance = feedback.instantiate()
				feedbackInstance.text = table.missing
				feedbackInstance.position = Vector2(232, 32)
				get_node("/root").add_child(feedbackInstance)
			
			if(gameController.mode == 1):
				$AnimationPlayer.play_backwards("EnfermeiroEntraVestes")
				await($AnimationPlayer.animation_finished)
			else:
				$AnimationPlayer.play_backwards("EnfermeiroEntra")
				await($AnimationPlayer.animation_finished)
			table.emit_signal("tableChange")
			Tablet._resetCheckBox()
			if(gameController.mode == 1):
				$AnimationPlayer.play("EnfermeiroEntraVestes")
			else:
				$AnimationPlayer.play("EnfermeiroEntra")
			
		elif(corDoCarimbo == "vermelho"):
			if(table.adequado == 1):
				var feedbackInstance = feedback.instantiate()
				feedbackInstance.text = "Errou"
				feedbackInstance.position = Vector2(232, 32)
				get_node("/root").add_child(feedbackInstance)
				
			else:
				var feedbackInstance = feedback.instantiate()
				feedbackInstance.text = "Acertou"
				$HUD._alterarPontuacao(10)
				feedbackInstance.position = Vector2(232, 32)
				get_node("/root").add_child(feedbackInstance)
				
			if(gameController.mode == 1):
				$AnimationPlayer.play_backwards("EnfermeiroEntraVestes")
				await($AnimationPlayer.animation_finished)
			else:
				$AnimationPlayer.play_backwards("EnfermeiroEntra")
				await($AnimationPlayer.animation_finished)
			table.emit_signal("tableChange")
			Tablet._resetCheckBox()
			if(gameController.mode == 1):
				$AnimationPlayer.play("EnfermeiroEntraVestes")
			else:
				$AnimationPlayer.play("EnfermeiroEntra")

func _on_area_2d_area_entered(area):
	if(area.is_in_group("Carimbo")):
		dentroRubrica = true
		corDoCarimbo = area.get_parent().tipo
		antiDoubleTap = false

func _on_area_2d_area_exited(area):
	if(area.is_in_group("Carimbo")):
		dentroRubrica = false
		corDoCarimbo = null
		antiDoubleTap = true



