extends Node2D

@onready var cateter_label = $CateterLabel/FuelLeft
@onready var spawn_point_1 = $SpawnPoint1
@onready var spawn_point_2 = $SpawnPoint2
@onready var spawn_point_3 = $SpawnPoint3
@onready var animation_player = $AnimationPlayer

@onready var tubo_1 = $Backgrounds/Background1/Tubo1
@onready var tubo_2 = $Backgrounds/Background2/Tubo2
@onready var tubo_3 = $Backgrounds/Background3/Tubo3
var current_frame:int = 0
var target_frame:int = 0
var current_checkpoint:int = 0

var fuel_left:float
var start = false
var finish_area_reached = false

signal maze_game_finished()
signal game_over()


func start_maze_game():
	cateter_label.text = str(round(fuel_left))
	mouse_start_position(1)

func _ready():
	for checkpoint:Area2D in $Backgrounds/Checkpoints.get_children():
		checkpoint.mouse_entered.connect(_on_checkpoints_mouse_entered.bind(checkpoint))


func _process(_delta):
	if start:
		if fuel_left <= 0 and !finish_area_reached:
			Singleton.feedback = "A medição não foi precisa e o cateter ficou muito curto!"
			game_over.emit()
			start = false


func mouse_start_position(stage:int):
	var x = get_window().size.x / 512.0
	var y = get_window().size.y / 288.0
	
	var dynamic_start_position:Vector2
	match stage:
		1:
			dynamic_start_position = Vector2(spawn_point_1.global_position.x * x, spawn_point_1.global_position.y * y)
		2:
			dynamic_start_position = Vector2(spawn_point_2.global_position.x * x, spawn_point_2.global_position.y * y)
		3:
			dynamic_start_position = Vector2(spawn_point_3.global_position.x * x, spawn_point_3.global_position.y * y)
	
	Input.warp_mouse(dynamic_start_position)
	start = true


func _on_left_wall_mouse_entered():
	maze_fail()


func _on_right_wall_mouse_entered():
	maze_fail()


func maze_fail():
	if start:
		Singleton.feedback = "Você encostou na veia durante a inserção do cateter!"
		game_over.emit()


func _on_finish_area_mouse_entered():
	if start:
		update_fuel_left()
		update_target_frame()
		finish_area_reached = true
		if fuel_left > 2:
			Singleton.feedback = "A medição não foi precisa e o cateter ficou grande demais!"
		else:
			print('maze finish')
		
		maze_game_finished.emit()


func _on_checkpoints_mouse_entered(node):
	if start:
		node.queue_free()
		update_fuel_left()
		update_target_frame()


func update_fuel_left():
	fuel_left -= 1
	cateter_label.text = str(round(fuel_left))


func update_target_frame():
	current_checkpoint += 1
	if current_checkpoint in [6, 11, 21]:
		target_frame += 1
	elif current_checkpoint in [20]:
		target_frame += 3
	else:
		target_frame += 2

func _on_transition_1_mouse_entered():
	if start:
		start = false
		$Backgrounds/Transitioners/Transition1.queue_free()
		update_fuel_left()
		update_target_frame()
		await get_tree().create_timer(0.6).timeout
		Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN
		animation_player.play('bg1_to_bg2')
		await get_tree().create_timer(1).timeout
		Input.mouse_mode = Input.MOUSE_MODE_CONFINED
		mouse_start_position(2)


func _on_transition_2_mouse_entered():
	if start:
		start = false
		$Backgrounds/Transitioners/Transition2.queue_free()
		update_fuel_left()
		update_target_frame()
		await get_tree().create_timer(0.6).timeout
		Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN
		animation_player.play('bg2_to_bg3')
		await get_tree().create_timer(1).timeout
		Input.mouse_mode = Input.MOUSE_MODE_CONFINED
		mouse_start_position(3)


func _on_animation_timer_timeout():
	if current_checkpoint <= 10:
		if current_frame < target_frame:
			current_frame += 1
			tubo_1.frame += 1
	elif current_checkpoint <= 20:
		if current_frame < target_frame:
			current_frame += 1
			tubo_2.frame += 1
	else:
		if current_frame < target_frame:
			current_frame += 1
			tubo_3.frame += 1
	
