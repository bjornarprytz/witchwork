class_name Move
extends Shift

var from_coords: Vector2i
var to_coords: Vector2i

func _init(b: Board, t: Materia, from: Vector2i, to: Vector2i) -> void:
	super._init(b,t)
	from_coords = from
	to_coords = to

func resolve_shift() -> Shift.Result:
	var origin_cell = board.get_cell(from_coords)
	assert(origin_cell.materia == target)
	var target_cell = board.get_cell(to_coords)
	assert(target_cell.is_empty())
	
	origin_cell.materia = null
	target_cell.materia = target
	
	return _result(origin_cell, target_cell)
