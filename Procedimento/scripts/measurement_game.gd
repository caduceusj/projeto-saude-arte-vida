extends Node2D

@onready var ok_button = $Ok
@onready var apagar_button = $Apagar
@onready var distance_label = $DistanceLabel

signal measuremant_game_finish(distance)

var origin = Vector2(0,0)
var destiny = Vector2(0,0)
var clicks = 0
var drawing = false
var distance = 0
var can_click = false

func _ready():
	disable_buttons()
	#Prevent acidental click on menu start
	await get_tree().create_timer(0.5).timeout
	can_click = true

func _process(_delta):
	if Input.is_action_just_pressed("mouse_click") and can_click:
		clicks += 1
		if clicks == 1:
			origin = get_local_mouse_position()
			drawing = true
		elif clicks == 2:
			destiny = get_local_mouse_position()
			drawing = false
			can_click = false
			enable_buttons()
		
	if drawing:
		destiny = get_local_mouse_position()
		distance = origin.distance_squared_to(destiny)
		distance = roundf(distance*0.005)
		distance_label.text = "Distância: "+ str(distance)
		queue_redraw()

func _draw():
	draw_dashed_line(origin, destiny, Color.BLACK, 1, 1, false)


func _on_ok_button_pressed():
	measuremant_game_finish.emit(distance)


func _on_apagar_pressed():
	clicks = 0
	origin = Vector2(0,0)
	destiny = Vector2(0,0)
	distance_label.text = "Distância: 0"
	queue_redraw()
	can_click = true
	disable_buttons()


func _on_buttons_mouse_entered():
	can_click = false


func _on_buttons_mouse_exited():
	can_click = true


func disable_buttons():
	ok_button.disabled = true
	apagar_button.disabled = true


func enable_buttons():
	ok_button.disabled = false
	apagar_button.disabled = false
