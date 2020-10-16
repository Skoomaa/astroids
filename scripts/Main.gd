extends Node
var count = 0
var asteroid = load("res://scenes/Asteroid.tscn")
var difficulty = 5# var a = 2
# var b = "text"
onready var stats = get_node("/root/Stats")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Score.text = "Score : " + str(stats.score)
	$Vie.text = "Vie : " + str(stats.vie)
	
	
	count += delta
	if count > difficulty:
		var newAsteroid = asteroid.instance()
		newAsteroid.cree(randomX(),0)
		add_child(newAsteroid)
		if difficulty > 1:
			difficulty -= 0.4
		count = 0
		
func randomX():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var random = rng.randf_range(0,1024)
	return random

