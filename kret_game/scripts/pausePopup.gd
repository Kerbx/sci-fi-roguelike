extends Popup


var pause = false


func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS


func _physics_process(delta):
	if Input.is_action_just_pressed("pauseGame"):
		pause = not pause
		
		if pause:
			get_tree().paused = true
			self.show()
		elif not pause:
			self.hide()
			get_tree().paused = false
