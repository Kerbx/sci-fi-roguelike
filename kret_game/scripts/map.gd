extends Node


onready var settingsFile = "res://etc/settings.tres"

func getPlayerColor():
	var file = File.new()
	var playerColor
	
	file.open(settingsFile, File.READ)
	
	while not file.eof_reached():
		var line = file.get_line()
		if 'playerColor' in line:
			line = line.split('=')
			playerColor = line[1].strip_edges()
	
	return playerColor

func _ready():
	var playerScene = load('res://Player/' + getPlayerColor())
	var playerObj = playerScene.instance()
	
	var saving = File.new()
	if not saving.file_exists("user://savegame.save"):
		playerObj.position.x = 676
		playerObj.position.y = 425
		add_child(playerObj)
	else:
		var loading = load("res://scripts/loading.gd")
		loading.load()
