extends Node2D

@onready var cateter_label = $CateterLabel
@onready var spawn_point = $SpawnPoint

var fuel_left:float
var distance:float
var start_position:Vector2
var last_mouse_position:Vector2
var start = false
var finish_area_reached = false

signal maze_game_finished()
signal game_over()


func start_maze_game():
	mouse_start_position()

func _ready():
	start_position = spawn_point.position
	last_mouse_position = spawn_point.position


func _process(_delta):
	if start:
		var mouse_position = get_global_mouse_position()
		
		if start_position.distance_to(mouse_position) > start_position.distance_to(last_mouse_position):
			distance = mouse_position.distance_to(last_mouse_position)*0.05
			fuel_left -= distance
			last_mouse_position = mouse_position
			
		cateter_label.text = 'Cateter restante:\n'+str(round(fuel_left))
		
		if fuel_left <= 0 and !finish_area_reached:
			Singleton.feedback = "A medição não foi precisa e o cateter ficou muito curto!"
			game_over.emit()
			start = false


func mouse_start_position():
	var x = get_window().size.x / 512.0
	var y = get_window().size.y / 288.0
	var dynamic_start_position = Vector2(spawn_point.global_position.x * x, spawn_point.global_position.y * y)
	Input.warp_mouse(dynamic_start_position)
	start = true


func _on_left_wall_mouse_entered():
	maze_fail()


func _on_right_wall_mouse_entered():
	maze_fail()


func maze_fail():
	Singleton.feedback = "Você encostou na veia durante a inserção do cateter!"
	game_over.emit()


func _on_finish_area_mouse_entered():
	finish_area_reached = true
	if fuel_left > 2:
		Singleton.feedback = "A medição não foi precisa e o cateter ficou grande demais!"
	elif fuel_left <=2:
		print('maze finish')
	
	maze_game_finished.emit()
