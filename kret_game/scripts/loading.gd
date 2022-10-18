extends Node


func loadGame():
	var saveGame = File.new()
	if not saveGame.file_exists("user://savegame.save"):
		return
	
	var saveNodes = get_tree().get_nodes_in_group("Persist")
	
	for i in saveNodes:
		i.queue_free()
		
	saveGame.open("user://savegame.save", File.READ)
	
	while not saveGame.eof_reached():
		var currentLine = parse_json(saveGame.get_line())
		
		var newObj = load(currentLine["filename"]).instance()
		get_node(currentLine["parent"]).add_child(newObj)
		newObj.position = Vector2(currentLine["posX"], currentLine["posY"])
		
	saveGame.close()
