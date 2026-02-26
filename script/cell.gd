extends Area2D

class_name Cell
signal cell_pressed(cell)

var x
var y
var size
const circle_image = preload(Constants.circle_path)
const cross_image = preload(Constants.cross_path)

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var polygon_2d: Polygon2D = $Polygon2D


func init(x: int, y: int, size: int) -> void:
	self.x = x
	self.y = y
	self.size = size
	
func _ready() -> void:
	input_pickable = true
	var vector_size = Vector2(size, size)
	var texture_size = circle_image.get_size()
	sprite_2d.scale = vector_size / texture_size
	collision_shape_2d.shape.size = vector_size
	queue_redraw()
	input_event.connect(_on_input_event)
	
func _draw() -> void:
	var half = size / 2.0
	draw_rect(Rect2(Vector2(-half, -half), Vector2(size, size)), Color.WHITE)

func _on_input_event(viewport, event, shape_idx):
	if event is not InputEventMouseButton: return
	if GameManager.is_game_over: return 
		
	if event.pressed and event.button_index == MOUSE_BUTTON_LEFT: 
		cell_pressed.emit(self)

func set_sprite(state: Constants.CellState) -> void:
	sprite_2d.texture = circle_image if state == Constants.CellState.O else cross_image
	
