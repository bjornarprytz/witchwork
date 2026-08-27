class_name Move
extends Shift


var destination: Cell

func _init(t: Cell, dest: Cell) -> void:
	super._init(t)
	destination = dest

func resolve_shift(_context: TheTurning) -> Shift.Result:
	assert(!target.is_empty())
	assert(destination.is_empty())
	
	destination.materia = target.materia
	target.materia = null
	
	return _result(target, destination)
