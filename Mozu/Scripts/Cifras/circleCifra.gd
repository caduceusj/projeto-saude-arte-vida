extends Node2D

var score = 0
var last_mouse_pos = Vector2()
var canTrack = false
var isClicked = false

func _input(event):
	if(event.is_action_pressed("mouse_click")):
		isClicked = true
	elif(event.is_action_released("mouse_click")):
		isClicked = false

func _ready():
	last_mouse_pos = get_global_mouse_position()

func _process(delta):
	var mouse_pos = get_global_mouse_position()
	var diff = mouse_pos - last_mouse_pos
	var distance = diff.length()
	$Label.text = str(score)
	if distance > 0 and canTrack and isClicked == true:
		score += distance/100
		print("Score: ", score)

	last_mouse_pos = mouse_pos


func _on_texture_rect_mouse_entered():
	canTrack = true


func _on_texture_rect_mouse_exited():
	canTrack = false
