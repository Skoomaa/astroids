 
extends KinematicBody2D
onready var stats = get_node("/root/Stats")
var vitesse
var velocite = Vector2()
onready var screen_size = get_viewport_rect().size
var moveX = random()
var moveY = random()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	
	wrap()
	velocite = Vector2(moveX,moveY)
	
	move_and_collide(velocite)
	
	
	

func creer(pos):
	position = pos
	

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
	stats.score += 50
	
	queue_free()
