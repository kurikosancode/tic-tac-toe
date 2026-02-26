extends Node2D

var size
var grid = []
var remaining

const cell_state = Constants.CellState
var turn = cell_state.X
const direction = [Vector2(1, 0), Vector2(0, 1), Vector2(1, -1), Vector2(1, 1)]

func init_grid(size: int) -> void:
	for y in range(size):
		grid.append([])
		for x in range(size):
			grid[y].append(Constants.CellState.EMPTY)

func init(size: int) -> void:
	self.size = size
	self.remaining = size * size
	init_grid(size)
	
	
func press_event(cell: Cell) -> void:
	var y = cell.y
	var x = cell.x
	if grid[y][x] != cell_state.EMPTY: return
	
	grid[y][x] = turn
	cell.set_sprite(turn)
	
	if turn == cell_state.X: turn = cell_state.O
	else: turn = cell_state.X
	remaining -= 1
	check_if_win(y, x)
	if remaining == 0 and not GameManager.is_game_over: 
		GameManager.game_over.emit(cell_state.EMPTY)
	
	
	
func check_if_win(y: int, x: int) -> void:
	var target_piece = grid[y][x]
	for d in direction:
		var dx = d.x
		var dy = d.y
		var valid = true
		var pieces = 0
		
		var cy = y; var cx = x
		while 0 <= cy and cy < size and 0 <= cx and cx < size:
			var current_piece = grid[cy][cx]
			if current_piece != target_piece:
				valid = false
				break
			
			pieces += 1
			cy += dy
			cx += dx
		
		
		if not valid:
			continue
			
		dx *= -1
		dy *= -1
		
		cy = y + dy; cx = x + dx
		while 0 <= cy and cy < size and 0 <= cx and cx < size:
			var current_piece = grid[cy][cx]
			if current_piece != target_piece: 
				valid = false
				break 
				
			pieces += 1
			cy += dy
			cx += dx
		
		if valid and pieces == size:
			GameManager.game_over.emit(target_piece)
			break
	
	
