extends Button

export var referencePath = ""
export(bool) var startFocused = false


func _ready():
	if(startFocused):
		grab_focus()
	
	connect("mouse_entered", self, "_onButtonMouseEntered")
	connect("pressed", self, "_onButtonPressed")
	
	
func _onButtonMouseEntered():
	grab_focus()


func _onButtonPressed():
	if("Player" in self.name):
		pass
	else:
		if(referencePath != ""):
			get_tree().change_scene(referencePath)
		else:
			get_tree().quit()
