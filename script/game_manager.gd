extends Node


var is_game_over = false
signal game_over(player: Constants.CellState)

func _ready() -> void:
	game_over.connect(func(p): is_game_over = true)
