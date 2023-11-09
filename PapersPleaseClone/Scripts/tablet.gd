extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$ScrollContainerConteudo.scale = Vector2(0,0)
	$TextureButtonEsquerda.scale = Vector2(0,0)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _resetCheckBox():
	for x in $ScrollContainerCheckBox/VBoxContainer.get_child_count():
		get_node("ScrollContainerCheckBox/VBoxContainer/CheckBox"+str(x+1)).set_pressed_no_signal(false)



func _on_texture_button_esquerda_pressed():
	$TextureButtonEsquerda.scale = Vector2(0,0)
	$TextureButtonDireita.scale = Vector2(1,1)
	$ScrollContainerConteudo.scale = Vector2(0,0)
	$ScrollContainerCheckBox.scale = Vector2(1,1)


func _on_texture_button_direita_pressed():
	$TextureButtonDireita.scale = Vector2(0,0)
	$TextureButtonEsquerda.scale = Vector2(1,1)
	$ScrollContainerCheckBox.scale = Vector2(0,0)
	$ScrollContainerConteudo.scale = Vector2(1,1)
