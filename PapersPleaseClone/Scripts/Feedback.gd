extends Node2D

@export var SPEED = -35
@export var FRICTION = -15
var text = "NULL"
var SHIFT_DIRECTION : Vector2 = Vector2.ZERO



@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = text
	SHIFT_DIRECTION = Vector2(0,-1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position += SPEED * SHIFT_DIRECTION * delta
	SPEED = max(SPEED - FRICTION * delta, 0 )
