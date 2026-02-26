extends Node2D

@onready var grid_manager: Node2D = $GridManager
@onready var button: Button = $CanvasLayer/CenterContainer/VBoxContainer/Button
@onready var label: Label = $CanvasLayer/CenterContainer/VBoxContainer/Label

@onready var board: Node2D = $Board
@onready var button_2: Button = $CanvasLayer/CenterContainer/VBoxContainer/Button2
@onready var color_rect: ColorRect = $CanvasLayer/ColorRect

func _ready() -> void:
	board.grid_manager = grid_manager
	label.hide()
	button.hide()
	button_2.hide()
	color_rect.hide()
	grid_manager.init(Constants.CELLS)
	board.add_cells()
	GameManager.game_over.connect(game_over)
			
func game_over(player: Constants.CellState) -> void:
	var message
	if player == Constants.CellState.EMPTY:
		message = "It's a Draw!"
	else:
		message = Constants.cell_values[player] + " Won!"
	label.text = message
	label.show()
	color_rect.show()
	button.show()
	button_2.show()
	
func restart_game():
	get_tree().reload_current_scene()
	GameManager.is_game_over = false
	
func _on_button_pressed() -> void:
	restart_game()
