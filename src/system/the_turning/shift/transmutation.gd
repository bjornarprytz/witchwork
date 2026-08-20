class_name Transmutation
extends Shift

var to_essence: Materia.Essence

func _init(b: Board, t: Materia, e: Materia.Essence) -> void:
	super._init(b,t)
	to_essence = e

func resolve_shift() -> Shift.Result:
	var before = target.essence
	target.essence = to_essence
	
	return _result(before, target.essence)
