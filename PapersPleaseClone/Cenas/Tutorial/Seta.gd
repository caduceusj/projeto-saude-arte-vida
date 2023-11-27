extends Sprite2D

var speed : float = 5.0
var amplitude : float = 10.0
var start_position : Vector2
var time = 0
var target_position : float

func _ready():
	start_position = position
	target_position = start_position.y

func _process(delta):
	time += delta
	target_position = start_position.y + amplitude * sin(speed * time)
	position.y = lerp(position.y, target_position, 0.1)
