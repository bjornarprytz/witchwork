class_name Creation
extends Shift

var to_create: Materia

func _init(t: Cell, m: Materia) -> void:
	super._init(t)
	to_create = m

func resolve_shift(_context: TheTurning) -> Shift.Result:
	assert(target.is_empty())
	
	target.materia = to_create
	
	return _result(null, to_create)
	
