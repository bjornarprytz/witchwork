class_name PhaseChange
extends Shift

var to_phase: Materia.Phase

func _init(b: Board, t: Cell, p: Materia.Phase) -> void:
	super._init(b,t)
	to_phase = p

func resolve_shift() -> Shift.Result:
	if (target.materia == null):
		push_warning("Materia no longer exists during phase change")
		return _noop()
	var before = target.materia.phase
	target.materia.phase = to_phase

	return _result(before, target.materia.phase)
