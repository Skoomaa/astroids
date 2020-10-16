extends Control

onready var stats = get_node("/root/Stats")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	 # Replace with function body.

	$GameOverScore.text  = "Score : " + str(stats.score)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
