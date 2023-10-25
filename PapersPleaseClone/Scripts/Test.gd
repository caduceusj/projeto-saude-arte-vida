extends Control

@onready var rubrica = $"Aba do Player/Rubrica/ColorRect"

var dentroRubrica = false

var corDoCarimbo
# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and dentroRubrica:
		if(corDoCarimbo == "verde"):
			rubrica.color = Color(0,255,0,255)
		elif(corDoCarimbo == "vermelho"):
			rubrica.color = Color(255,0,0,255)
			
func _on_area_2d_area_entered(area):
	if(area.is_in_group("Carimbo")):
		dentroRubrica = true
		corDoCarimbo = area.get_parent().tipo
