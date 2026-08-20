class_name Creation
extends Shift

var coords: Vector2i

func _init(b: Board, t: Materia, c: Vector2i) -> void:
	super._init(b,t)
	coords = c

func resolve_shift() -> Shift.Result:
	var target_cell = board.get_cell(coords)
	assert(target_cell.is_empty())
	
	target_cell.materia = target
	
	return _result(null, target_cell)
	
