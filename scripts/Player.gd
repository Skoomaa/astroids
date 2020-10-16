extends KinematicBody2D
onready var stats = get_node("/root/Stats")
onready var screen_size = get_viewport_rect().size
var vitesse = 200
var velocite = Vector2()
export (PackedScene) var balle
onready var canon = $Canon
var oldRotation = 0
var regressSpeed = 200
func _ready():
	pass

func _physics_process(delta):
	get_input(delta)
	wrap()
	
	
	
	
	var dir = get_global_mouse_position() - global_position
	if dir.length() > 5:
		rotation = dir.angle()
		var collision = move_and_collide(velocite/100)
		if collision:
			
			if "Asteroid" in collision.collider.name:
					
				collision.collider.destroy()
				stats.vie -= 1
				position.x = 512
				position.y = 300
				velocite = Vector2()
			
				
				
				
				
				

	
func get_input(delta):
	var avance = Input.is_action_pressed("ui_avance")
	var shoot = Input.is_action_just_pressed("ui_accept")
	
	if avance:
		velocite = Vector2(vitesse, 0).rotated(rotation)
		regressSpeed = 0
		oldRotation = rotation
	if !avance:
		regressSpeed += delta*60
		if regressSpeed <= 200:
			velocite = Vector2(vitesse-regressSpeed,0).rotated(oldRotation)
	if shoot:
		var b = balle.instance()
		b.creer(canon.global_position, rotation)
		get_parent().add_child(b)
	
		
func wrap():
	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)
	
func _on_Player_area_entered(area):
	queue_free()
	

	
	
