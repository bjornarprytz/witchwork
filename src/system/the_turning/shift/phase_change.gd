class_name PhaseChange
extends Shift

var to_phase: Materia.Phase

func _init(t: Cell, p: Materia.Phase) -> void:
	super._init(t)
	to_phase = p

func resolve_shift(_context: TheTurning) -> Shift.Result:
	if (target.materia == null):
		push_warning("Materia no longer exists during phase change")
		return _noop()
	var before = target.materia.phase
	target.materia_next.phase = to_phase
	target.materia_next.age = target.materia.age + 1

	return _result(before, target.materia_next.phase)
