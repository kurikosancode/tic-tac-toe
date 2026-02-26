extends Node2D

const cell_scene = preload("uid://c13qa5hxjk26f")

var grid_manager

func add_cells() -> void:
	for y in range(Constants.CELLS):
		for x in range(Constants.CELLS):
			var cell = cell_scene.instantiate()
			cell.init(x, y, Constants.CELL_SIZE)
			cell.cell_pressed.connect(grid_manager.press_event)
			var position = Vector2(x * Constants.CELL_SIZE + Constants.PADDING * x, 
									y * Constants.CELL_SIZE + Constants.PADDING * y)
			cell.position = position
			add_child(cell)
			
