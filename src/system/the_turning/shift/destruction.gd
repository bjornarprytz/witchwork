class_name Destruction
extends Shift

func _init(b: Board, t: Cell) -> void:
	super._init(b,t)

func resolve_shift() -> Shift.Result:
	assert(!target.is_empty())
	
	var destroyed_materia = target.materia
	target.materia = null
	
	return _result(destroyed_materia, null)
	
