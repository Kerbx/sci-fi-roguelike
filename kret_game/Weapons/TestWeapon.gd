extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	
func getAimDirection() -> Vector2:
	var direction = Vector2.ZERO

	direction = (get_global_mouse_position() - global_position).normalized()
	
	return direction


func _physics_process(delta):
	var raycast = RayCast2D
	
	var cast = getAimDirection()
	var angle = cast.angle()
	
	rotation = angle

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass