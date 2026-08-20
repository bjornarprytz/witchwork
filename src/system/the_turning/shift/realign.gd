class_name Realign
extends Shift

var to_element: Materia.Element

func _init(b: Board, t: Materia, e: Materia.Element) -> void:
	super._init(b,t)
	to_element = e

func resolve_shift() -> Shift.Result:
	var before = target.element
	target.element = to_element
	
	return _result(before, target.element)
