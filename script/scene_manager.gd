extends Node

# could make this into a dictionary so that they can just call the dict
func go_to_menu():
	get_tree().change_scene_to_file(Constants.MENU_PATH)

func start_game():
	get_tree().change_scene_to_file(Constants.GAME_PATH)
