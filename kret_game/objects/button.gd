extends Button

export var referencePath = ""
export(bool) var startFocused = false

onready var settingsFile = "res://etc/settings.tres"

func _ready():
	if(startFocused):
		grab_focus()
	
	connect("mouse_entered", self, "_onButtonMouseEntered")
	connect("pressed", self, "_onButtonPressed")
	
	
func _onButtonMouseEntered():
	grab_focus()


func _onButtonPressed():
	if("Player" in self.name):
		var file = File.new()
		file.open(settingsFile, File.WRITE)
		var index = 1
		file.store_line("playerColor = " + self.name + ".tscn")
	else:
		if(referencePath != ""):
			get_tree().change_scene(referencePath)
		else:
			get_tree().quit()
