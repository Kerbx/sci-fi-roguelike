extends KinematicBody2D


export (int) var speed
var velocity = Vector2()


func _ready():
	pass # Replace with function body.


func getInput():
	if Input.is_action_pressed("playerMovementUp"):
		velocity = Vector2.UP
	elif Input.is_action_pressed("playerMovementDown"):
		velocity = Vector2.DOWN
	elif Input.is_action_pressed("playerMovementLeft"):
		velocity = Vector2.LEFT
	elif Input.is_action_pressed("playerMovementRight"):
		velocity = Vector2.RIGHT
	else:
		velocity = Vector2.ZERO
		
	velocity = velocity.normalized() * speed


func _physics_process(delta):
	getInput()
	velocity = move_and_slide(velocity)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
