class_name Transmutation
extends Shift

var to_essence: Materia.Essence

func _init(t: Cell, e: Materia.Essence) -> void:
	super._init(t)
	to_essence = e

func resolve_shift(_context: TheTurning) -> Shift.Result:
	var before = target.materia.essence
	target.materia.essence = to_essence
	
	return _result(before, target.materia.essence)
