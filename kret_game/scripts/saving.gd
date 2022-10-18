extends Node


func save():
	var saveDict = {
		"filename": get_filename(),
		"parent": get_parent().get_path(),
		"posX": get_parent().position.x,
		"posY": get_parent().position.y,
	}
	
	return saveDict


func saveGame():
	var saveGame = File.new()
	saveGame.open("user://savegame.save", File.WRITE)
	var saveNodes = get_tree().get_nodes_in_group("Persist")
	
	for i in saveNodes:
		var nodeData = i.call("save");
		saveGame.store_line(to_json(nodeData))
		
	saveGame.close()
