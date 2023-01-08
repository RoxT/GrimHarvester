extends Area2D

export var speed = 40
var dir
var running = false

signal grim_neared(spirit)
signal grim_touched(spirit)

var directions = {
	"Up": Vector2(0, -1),
	"Down": Vector2(0, 1),
	"Left": Vector2(-1, 0),
	"Right": Vector2(1, 0)
}

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dir != null:
		translate(dir * speed * delta * (5 if running else 1))
	else: 
		var areas:Array = get_overlapping_areas()
		if !areas.empty():
			var dirs = []
			if areas[0].position.x > 0:
				dirs.push_back(directions.Right)
			else:
				dirs.push_back(directions.Left)
			if areas[0].position.y > 0:
				dirs.push_back(directions.Down)
			else:
				dirs.push_back(directions.Up)
			dir = dirs[randi() % dirs.size()]
		if dir == null:
			dir = directions.values()[randi() % directions.size()]
		$Run.wait_time = randf() + 0.5
		$Run.start()
		


func _on_Run_timeout():
	dir = null
	running = false
	
func run_away(pos:Vector2):
	dir = (position-pos).normalized()
	$Run.wait_time = randf() + 0.5
	$Run.start()
	running = true


func _on_Aura_Area2D_body_entered(body:Node):
	if body.name == "PlayerGrim":
		emit_signal("grim_neared", self)

func _on_Body_body_entered(body:Node):
	if body.name == "PlayerGrim":
		emit_signal("grim_touched", self)
