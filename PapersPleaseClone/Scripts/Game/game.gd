extends Control


@onready var rubrica = $Rubrica/Rubrica
@export var dialogos : Resource
@export var table : Node2D
@export var Tablet : Node2D


var aleatorizar = RandomNumberGenerator

var dentroRubrica = false

var resposta = 0

var adequado = false

var corDoCarimbo
# Called when the node enters the scene tree for the first time.
func _ready():
	table.emit_signal("tableChange")
	$AnimationPlayer.play("EnfermeiroEntra")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):

	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and dentroRubrica:
		if(corDoCarimbo == "verde"):
			if(table.adequado == 1):
				$Label.text = "Acertou"
			else:
				$Label.text = "Errou"
			$AnimationPlayer.play_backwards("EnfermeiroEntra")
			await($AnimationPlayer.animation_finished)
			table.emit_signal("tableChange")
			Tablet._resetCheckBox()
			$AnimationPlayer.play("EnfermeiroEntra")
			
		elif(corDoCarimbo == "vermelho"):
			if(table.adequado == 1):
				$Label.text = "Errou"
			else:
				$Label.text = "Acertou"
			$AnimationPlayer.play_backwards("EnfermeiroEntra")
			await($AnimationPlayer.animation_finished)
			table.emit_signal("tableChange")
			Tablet._resetCheckBox()
			$AnimationPlayer.play("EnfermeiroEntra")
			

func _on_area_2d_area_entered(area):
	if(area.is_in_group("Carimbo")):
		dentroRubrica = true
		corDoCarimbo = area.get_parent().tipo


func _on_area_2d_area_exited(area):
	if(area.is_in_group("Carimbo")):
		dentroRubrica = false
		corDoCarimbo = null
