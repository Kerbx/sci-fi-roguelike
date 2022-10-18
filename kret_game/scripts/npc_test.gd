extends RigidBody2D

onready var animSprite = $AnimatedSprite


func _ready():
	animSprite.playing = true


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
