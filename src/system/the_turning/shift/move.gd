class_name Move
extends Shift


var destination: Cell

func _init(b: Board, t: Cell, dest: Cell) -> void:
	super._init(b,t)
	destination = dest

func resolve_shift() -> Shift.Result:
	assert(!target.is_empty())
	assert(destination.is_empty())
	
	destination.materia = target.materia
	target.materia = null
	
	return _result(target, destination)
