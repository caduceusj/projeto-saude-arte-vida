extends Node2D

var selected = false
var mouse_offset = Vector2(0, 0)
@export var tutorialScript : Control
@export var tipo = "verde"
var tween


func _process(delta):
	if selected:
		scale = Vector2(1.5,1.5)
		followMouse()
	else:
		scale = Vector2(1,1)
		

func followMouse():
	position = get_global_mouse_position() + mouse_offset

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and selected == true:
		if event.pressed:
			
			$Sprite2D.play("carimba")
			await($Sprite2D.animation_finished)
			mouse_offset = position - get_global_mouse_position()
			if(tipo == "verde"):
				tween = create_tween()
				tween.tween_property(self, "position", Vector2(54, 230), 1.0).from(position)
			else:
				tween = create_tween()
				tween.tween_property(self, "position", Vector2(94,230), 1.0).from(position)
			selected = false
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			if(tutorialScript):
				tutorialScript.selected = false

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and selected == false:
		if event.pressed:
			Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
			mouse_offset = position - get_global_mouse_position()
			selected = true
