extends Button
onready var stats = get_node("/root/Stats")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	 # Replace with function body.
	
	stats.vie = 3

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_Button_pressed():
	stats.score = 0
	get_tree().change_scene("res://scenes/MainMenu.tscn") 
