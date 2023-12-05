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
	elif(gameController.mode == 2):
		table = $Enfermeiro/ColorRect2/TableContainer
		$Enfermeiro/ColorRect2/TableContainer.show()
		$Enfermeiro/ColorRect2/MesaVestes.hide()
	table.emit_signal("tableChange")
	$AnimationPlayer.play("EnfermeiroEntra")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):

	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and dentroRubrica and antiDoubleTap == false:
		antiDoubleTap = true
		if(corDoCarimbo == "verde"):
			if(table.adequado == 1):
				print("1")
				var feedbackInstance = feedback.instantiate()
				feedbackInstance.text = "Acertou"
				feedbackInstance.position = Vector2(232, 32)
				get_node("/root").add_child(feedbackInstance)
				
			else:
				print("2")
				var feedbackInstance = feedback.instantiate()
				feedbackInstance.text = table.missing
				feedbackInstance.position = Vector2(232, 32)
				get_node("/root").add_child(feedbackInstance)
				
			$AnimationPlayer.play_backwards("EnfermeiroEntra")
			await($AnimationPlayer.animation_finished)
			table.emit_signal("tableChange")
			Tablet._resetCheckBox()
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
				feedbackInstance.position = Vector2(232, 32)
				get_node("/root").add_child(feedbackInstance)
				
			$AnimationPlayer.play_backwards("EnfermeiroEntra")
			await($AnimationPlayer.animation_finished)
			table.emit_signal("tableChange")
			Tablet._resetCheckBox()
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



