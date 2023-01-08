extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Answer.hide()
	$Qu.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.name == "PlayerGrim":
		$Answer.show()
		$Qu.hide()


func _on_Area2D_body_exited(body):
	if body.name == "PlayerGrim":
		$Answer.hide()
		$Qu.show()
