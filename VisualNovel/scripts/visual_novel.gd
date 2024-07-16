extends Node2D

const Ballon = preload("res://VisualNovel/dialogos/balloon.tscn")

@export var dialogue_resource: DialogueResource
var dialogue_start : String = "inicio"

var caso_atual = 1 # Num do caso na sequência sorteada (1,2,3) ou (1,2,3,4)
var caso_num_atual # Num do caso na posição caso_atual dos sorteados (1 à 8)
#var caso_prioridade # Primeiro caso picc
var caso_prioridade = 1
#var num_casos = 0
var num_casos = 2
var casos_picc = [1, 2, 3 , 4]
var casos_obs = [5, 6, 7, 8]
#var casos_sorteados = []
var casos_sorteados = [1,5]
#var casos_protocolo = ["obs", "obs", "obs"]
var casos_protocolo = ["PICC", "obs"]
var tipos_mae = ['normal', 'preocupada', 'indiferente']
var mae_tipo = ""


func _ready():
	#sortear_casos()
	randomizar_mae()
	caso_num_atual = casos_sorteados[0]
	$Character.personagem_chegando()
	
func _on_character_personagem_chegou():
	var ballon = Ballon.instantiate()
	get_tree().current_scene.add_child(ballon)
	ballon.start(dialogue_resource, dialogue_start)
	
func mostrar_caso():
	esconder_dialogo()
	$Papel.mostrar_papel()

func sortear_casos():
	num_casos = randi_range(3,4)
	var sorteio_picc = 1
	var sorteio_obs = 2
	var limite_casos_picc = casos_picc.size()
	if (num_casos > 3):
		sorteio_picc = 2
		casos_protocolo.append("obs")
	
	for i in range(sorteio_picc):
		var caso = randi_range(0, casos_picc.size()-1)
		casos_sorteados.append(casos_picc.pop_at(caso))
		sorteio_picc -= 1
	
	for j in range(sorteio_obs):
		var caso = randi_range(0, casos_obs.size()-1)
		casos_sorteados.append(casos_obs.pop_at(caso))
		sorteio_obs -= 1

	casos_sorteados.shuffle()
	
	for i in casos_sorteados.size():
		if(casos_sorteados[i] <= limite_casos_picc):
			casos_protocolo[i] = "PICC"
			if (caso_prioridade == null):
				caso_prioridade = i+1
			
	print('casos_sorteados ', casos_sorteados)
	print('casos_protocolo ', casos_protocolo)


func randomizar_mae():
	var mae_rng = randi_range(0, 2)
	Singleton.character2 = Singleton.mae_sprites[mae_rng]
	mae_tipo = tipos_mae[mae_rng]
	print('tipo mae: ', mae_tipo)
	
func testar_caso(protocolo_escolhido):
	var index = caso_atual - 1
	if casos_protocolo[index] != protocolo_escolhido:
		if casos_protocolo[index] == "obs":
			feedback_picc_erro()
		else:
			feedback_obs_erro()
		game_over()

func feedback_picc_erro():
	Singleton.feedback += "No caso "+str(caso_atual)+", foi decidido realizar o procedimento PICC, quando não era realmente necessário.\n"
	
func feedback_obs_erro():
	Singleton.feedback += "No caso "+str(caso_atual)+", o ideal seria ter realizado o procedimento PICC.\n"
	
func feedback_linguagem():
	Singleton.feedback += "No caso "+str(caso_atual)+", sua resposta fugiu da conduta esperada por um profissional.\n"
	game_over()

func feedback_mentira():
	Singleton.feedback += "No caso "+str(caso_atual)+", sua resposta não pode divergir da verdade.\n"
	game_over()
	
func game_over():
	esconder_dialogo()
	if Singleton.feedback == "":
		Singleton.feedback = "Parabéns, você conduziu corretamente os casos dos pacientes"
	SceneTransition.change_scene("res://VisualNovel/cenas/feedback.tscn")
	
func mudar_cenario(background, character):
	SceneTransition.fade_in_animation()
	await get_tree().create_timer(1).timeout
	var novo_background = load(background)
	$BackGround.set_texture(novo_background)
	$Character.mudar_textura(character)
	await get_tree().create_timer(1).timeout
	

func _input(event: InputEvent):
	if(event.is_action_pressed("ui_cancel")):
		var estado_atual = get_tree().paused
		if(estado_atual):
			$PauseMenu.hide()
		else:
			$PauseMenu.show()
		get_tree().paused = !estado_atual


func _on_pause_menu_reiniciar_jogo():
	esconder_dialogo()
	SceneTransition.change_scene("res://VisualNovel/cenas/visual_novel.tscn")


func esconder_dialogo():
	var node = get_node_or_null("ExampleBalloon")
	if (node != null):
			node.hide()


func _on_papel_proximo_caso():
	await get_tree().create_timer(0.5).timeout
	var dialogo = get_node_or_null("ExampleBalloon")
	dialogo.show()
	if (caso_atual == num_casos):
		await get_tree().create_timer(0.5).timeout
		$Papel.queue_free()
		
		
func atualizar_caso():
	caso_atual += 1
	caso_num_atual = casos_sorteados[caso_atual - 1]
