class_name PhaseChange
extends Shift

var to_phase: Materia.Phase

func _init(b: Board, t: Cell, p: Materia.Phase) -> void:
	super._init(b,t)
	to_phase = p

func resolve_shift() -> Shift.Result:
	var before = target.phase
	target.materia.phase = to_phase

	return _result(before, target.materia.phase)
