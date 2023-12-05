extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$TextureButtonEsquerda.hide()
	$ScrollContainerConteudo.hide()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _resetCheckBox():
	for x in $ScrollContainerCheckBox/VBoxContainer.get_child_count():
		get_node("ScrollContainerCheckBox/VBoxContainer/CheckBox"+str(x+1)).set_pressed_no_signal(false)

func _on_texture_button_esquerda_pressed():
	$TextureButtonEsquerda.hide()
	$TextureButtonDireita.show()
	$ScrollContainerConteudo.hide()
	$ScrollContainerCheckBox.show()

func _on_texture_button_direita_pressed():
	$TextureButtonEsquerda.show()
	$TextureButtonDireita.hide()
	$ScrollContainerConteudo.show()
	$ScrollContainerCheckBox.hide()
