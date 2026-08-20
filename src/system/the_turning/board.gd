class_name Board
extends Object

var _lookup: Dictionary[String, Cell] = {}

var width:int
var height:int
var cells: Array[Cell]:
	get:
		return _lookup.values()

func _init(width_: int, height_: int) -> void:
	assert(width_ > 0 and height_ > 0)
	width = width_
	height = height_

func add(cell:Cell) -> Cell:
	var key = keygen_cell(cell)
	assert(!_lookup.has(key))
	_lookup[key] = cell
	return cell

func get_cell(coords: Vector2i) -> Cell:
	assert(in_bounds(coords))
	var key = keygen_coords(coords)
	
	if (!_lookup.has(key)):
		return add(Cell.new(coords.x, coords.y))
	
	return _lookup[key]

func in_bounds(coords: Vector2i) -> bool:
	return coords.x >= 0 and coords.x < width and coords.y >= 0 and coords.y < height

static func keygen(x:int, y:int) -> String:
	return "%d,%d" % [x, y]

static func keygen_coords(coords: Vector2i) -> String:
	return keygen(coords.x,coords.y)

static func keygen_cell(cell:Cell) -> String:
	return keygen_coords(cell.coords)
