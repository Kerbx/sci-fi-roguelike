extends KinematicBody2D


export (int) var speed
onready var animatedSprite = $AnimatedSprite
var velocity = Vector2()


func _ready():
	pass # Replace with function body.


func getInput():
	animatedSprite.flip_h = false
	if Input.is_action_pressed("playerMovementUp"):
		velocity = Vector2.UP
		animatedSprite.play("run")
	elif Input.is_action_pressed("playerMovementDown"):
		velocity = Vector2.DOWN
		animatedSprite.play("run")
	elif Input.is_action_pressed("playerMovementLeft"):
		velocity = Vector2.LEFT
		animatedSprite.play("run")
		animatedSprite.flip_h = true
	elif Input.is_action_pressed("playerMovementRight"):
		velocity = Vector2.RIGHT
		animatedSprite.play("run")
	else:
		velocity = Vector2.ZERO
		animatedSprite.play("idle")
		
	velocity = velocity.normalized() * speed


func _physics_process(delta):
	getInput()
	velocity = move_and_slide(velocity)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
