extends Node


onready var settingsFile = "res://etc/settings.tres"

func getPlayerColor():
	var file = File.new()
	var playerColor
	
	print_debug(settingsFile)
	file.open(settingsFile, File.READ)
	
	while not file.eof_reached():
		var line = file.get_line()
		if 'playerColor' in line:
			line = line.split('=')
			playerColor = line[1].strip_edges()
	
	print_debug(playerColor)
	return playerColor

func _ready():
	var playerScene = load('res://Player/' + getPlayerColor())
	var playerObj = playerScene.instance()
	playerObj.position.x = 676
	playerObj.position.y = 425
	add_child(playerObj)
