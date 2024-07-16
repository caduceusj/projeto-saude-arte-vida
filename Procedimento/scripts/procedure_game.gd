extends Node2D

@onready var measurement_game = $Minigames/MeasurementGame
@onready var angle_game = $Minigames/AngleGame
@onready var cleaning_game = $Minigames/Cleaning_game
@onready var maze_game = $Minigames/MazeGame
@onready var label = $Label


var distance = 0
func _ready():
	Singleton.checkpoint_scene = "res://Procedimento/cenas/procedure_game.tscn"
	measurement_game.show()
	angle_game.hide()
	cleaning_game.hide()
	label.text = "Meça a distância do local da inserção até o centro do tórax"


func _on_measuremant_game_finish(dist):
	SceneTransition.fade_in_animation()
	await get_tree().create_timer(1).timeout
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN	
	distance = dist
	maze_game.fuel_left = dist
	measurement_game.queue_free()
	label.text = "Realize a antissepsia do local da inserção"
	cleaning_game.show()


func _on_cleaning_game_finished():
	SceneTransition.fade_in_animation()
	await get_tree().create_timer(1).timeout
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	cleaning_game.queue_free()
	label.text = "Realize a inserção num ângulo de 15º"
	angle_game.show()


func _on_angle_game_finish():
	SceneTransition.fade_in_animation()
	await get_tree().create_timer(1).timeout
	angle_game.queue_free()
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	maze_game.show()
	maze_game.start_maze_game()


func _on_maze_game_finished():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	game_over()


func game_over():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if Singleton.feedback == "":
		Singleton.feedback = "Parabéns!"
	SceneTransition.change_scene("res://VisualNovel/cenas/feedback.tscn")



