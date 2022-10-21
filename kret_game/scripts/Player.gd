extends KinematicBody2D


export (int) var speed = 500
onready var animatedSprite = $AnimatedSprite
onready var animationPlayer = $AnimationPlayer
var velocity = Vector2()
var direction

func _ready():
	pass
	

func getInput():
	if Input.is_action_pressed("pauseGame"):
		get_tree().change_scene("res://scenes/pause.tscn")
	elif Input.is_action_pressed("playerMovementUp"):
		velocity = Vector2.UP
		animatedSprite.animation = "run"
		animationPlayer.play("run")
	elif Input.is_action_pressed("playerMovementDown"):
		velocity = Vector2.DOWN
		animatedSprite.animation = "run"
		animationPlayer.play("run")
	elif Input.is_action_pressed("playerMovementLeft"):
		velocity = Vector2.LEFT
		animatedSprite.animation = "run"
		animationPlayer.play("run")
	elif Input.is_action_pressed("playerMovementRight"):
		velocity = Vector2.RIGHT
		animatedSprite.animation = "run"
		animationPlayer.play("run")
	else:
		velocity = Vector2.ZERO
		animatedSprite.animation = "idle"
		animationPlayer.play("idle")
	
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	direction = (get_global_mouse_position() - global_position).normalized()
	if direction.x > 0 and animatedSprite.flip_h:
		animatedSprite.flip_h = false
	if direction.x < 0 and not animatedSprite.flip_h:
		animatedSprite.flip_h = true
		
	getInput()
	velocity = move_and_slide(velocity)
	
