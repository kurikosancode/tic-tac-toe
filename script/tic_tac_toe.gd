extends Node2D

@onready var grid_manager: Node2D = $GridManager


@onready var board: Node2D = $Board

@onready var color_rect: ColorRect = $CanvasLayer/ColorRect
@onready var label: Label = $CanvasLayer/Label
			
func _ready() -> void:
	board.grid_manager = grid_manager
	label.hide()
	color_rect.hide()
	grid_manager.init(Constants.CELLS)
	board.add_cells()
	GameManager.game_over.connect(game_over)
			
func game_over(player: Constants.CellState) -> void:
	var message = Constants.cell_values[player] + " Won!"
	label.text = message
	label.show()
	color_rect.show()
	
func _process(delta: float) -> void:
	pass
