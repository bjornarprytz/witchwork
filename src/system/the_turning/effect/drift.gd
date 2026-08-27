class_name Drift
extends Effect

var cell: Cell

func _init(cell_: Cell):
	cell = cell_

func resolve_effect(context: TheTurning) -> Array[Shift.Result]:
	## TODO: Drift, depending on the element
	print("Drift: [%s]" % cell)
	
	if (cell.materia == null):
		return [] # TODO: Maybe spawn somethings instead
	
	var shift = PhaseChange.new(cell, Materia.next_phase(cell.materia.phase))
	
	var r = shift.resolve(context)
	
	return [r]
