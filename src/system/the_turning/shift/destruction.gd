class_name Destruction
extends Shift

func _init(t: Cell) -> void:
	super._init(t)

func resolve_shift(_context: TheTurning) -> Shift.Result:
	assert(!target.is_empty())
	
	var destroyed_materia = target.materia
	target.queue_destruction = true
	
	return _result(destroyed_materia, null)
	
