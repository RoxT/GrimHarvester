extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Spirit_grim_entered():
	if $Trees/PlayerGrim.running == true:
		pass


func _on_Spirit_grim_neared(spirit):
	if $Trees/PlayerGrim.running == true:
		spirit.run_away($Trees/PlayerGrim.position)


func _on_Spirit_grim_touched(spirit):
	spirit.queue_free()
	$Trees/PlayerGrim/AnimatedSprite.frame = 0
	$Trees/PlayerGrim/AnimatedSprite.play()
