class_name Realign
extends Shift

var to_element: Materia.Element

func _init(t: Cell, e: Materia.Element) -> void:
	super._init(t)
	to_element = e

func resolve_shift(_context: TheTurning) -> Shift.Result:
	var before = target.materia.element
	target.materia.element = to_element
	
	return _result(before, target.materia.element)
