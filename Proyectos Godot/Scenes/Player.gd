extends Area2D

@export var speed = 200
var direction = Vector2.ZERO

@onready var collition_rect: CollisionShape2D = $CollisionShape2D

var bounding_size_x
var start_bound
var end_bound

func _ready():

	bounding_size_x = collition_rect.shape.get_rect().size.x
	
	var rect = get_viewport().get_visible_rect()
	start_bound = -20
	end_bound = 1170

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	var input = Input.get_axis("move_left", "move_right")
	
	if input > 0:
		direction = Vector2.RIGHT
	elif input < 0:
		direction = Vector2.LEFT
	else:
		direction = Vector2.ZERO

	var delta_movement = speed * delta * direction.x
	
	#te estas saliendo de la pantalla?
	if (position.x + delta_movement < start_bound + bounding_size_x * transform.get_scale().x ||
	   position.x + delta_movement > end_bound - bounding_size_x * transform.get_scale().x):
		
		return
	
	position.x += delta_movement
