extends KinematicBody2D
onready var stats = get_node("/root/Stats")
var miniAsteroids = load("res://scenes/MiniAsteroid.tscn")
var vitesse = 1
var velocite = Vector2()# Declare member variables here. Examples:
onready var screen_size = get_viewport_rect().size
var moveX = random()
var moveY = random()




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta):
	wrap()
	velocite = Vector2(moveX,moveY)
	move_and_collide(velocite)
	
		
			
			
			
func wrap():
	if position.x < 0:
		position.x = 1024
	if position.y < 0:
		position.y = 600
	if position.x > 1024:
		position.x = 0
	if position.y > 600:
		position.y = 0

func random():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var random = rng.randf_range(-2,2)
	return random

	
	
func destroy():
	stats.score += 100
	for i in range(2):
			var ma = miniAsteroids.instance()
			ma.creer(position)
			get_parent().add_child(ma)
			queue_free()
	
func cree(posX,posY):
	position.x = posX
	position.y = posY
	 

	
