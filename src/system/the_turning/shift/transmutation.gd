class_name Transmutation
extends Shift

var to_essence: Materia.Essence

func _init(b: Board, t: Cell, e: Materia.Essence) -> void:
	super._init(b,t)
	to_essence = e

func resolve_shift() -> Shift.Result:
	var before = target.materia.essence
	target.materia.essence = to_essence
	
	return _result(before, target.materia.essence)
