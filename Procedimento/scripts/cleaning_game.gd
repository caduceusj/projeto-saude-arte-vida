extends Node2D

@onready var algodao = $Algodao
@onready var cleaning_area = $Area2D
@onready var progress_bar = $ProgressBar

var cleaning = false
var last_mouse_pos:Vector2
var cleaning_left = 10
var cleaining_speed = 2
var finished = false

signal cleaning_game_finished()

func _process(delta):
	algodao.position = get_local_mouse_position()
	
	if cleaning and last_mouse_pos != algodao.position:
		last_mouse_pos = algodao.position
		cleaning_left -= cleaining_speed * delta
		progress_bar.value = cleaning_left
	
	if cleaning_left <= 0 and not finished:
		finished = true
		cleaning_game_finished.emit()
		
func _on_area_2d_mouse_entered():
	cleaning = true
	

func _on_area_2d_mouse_exited():
	cleaning = false


