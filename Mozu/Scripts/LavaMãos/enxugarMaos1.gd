extends Control

var previousClickSize = -1

var clicaveisAux = 0

@export var nextStage : PackedScene
@export var StartAnimation : AnimatedSprite2D


@export var tempo = 100

var hasDisplayedFeedback = false

func _ready():
	if(StartAnimation != null):
		$StartAnimation.play("default")
		await($StartAnimation.animation_finished)
		$StartAnimation.hide()
	$ProgressBar.max_value = tempo
	$ProgressBar.value = tempo


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if(hasDisplayedFeedback == false and $ProgressBar.value > 0 and previousClickSize == 0):
		hasDisplayedFeedback = true
		$AnimationPlayer.play("Feedback")
		$floatingLabel/Label.text = "Bom Trabalho!"
	elif(hasDisplayedFeedback == false and $ProgressBar.value <= 0 and previousClickSize == 0):
		hasDisplayedFeedback = true
		$AnimationPlayer.play("Feedback")
		$floatingLabel/Label.text = "Pode melhorar!"

	if(get_node("clicaveis").get_child_count() != previousClickSize and get_node("clicaveis").get_child_count() != 0 ):
		previousClickSize = get_node("clicaveis").get_child_count()
		var tween = create_tween()
		tween.tween_property(get_node("clicaveis").get_child(0), "modulate", Color(1,1,1,1), 0.1)
	elif(get_node("clicaveis").get_child_count() == 0):
		$Sprite2D.play("default")
		previousClickSize = 0
		await(get_tree().create_timer(3.0).timeout)
		get_tree().change_scene_to_packed(nextStage)
	
	
		
	if(previousClickSize !=0):
		$ProgressBar.value -= delta
	
