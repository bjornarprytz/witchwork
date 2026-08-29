class_name Drift
extends Rule

var cell: Cell

func _init(cell_: Cell):
	cell = cell_

func resolve_rule(context: TheTurning) -> Array[Shift.Result]:
	## TODO: Drift, depending on the element
	print("Drift: [%s]" % cell)
	
	if (cell.is_empty()):
		return _drift_empty_cell(context)
	
	return _drift_materia(context)

func _drift_empty_cell(context: TheTurning) -> Array[Shift.Result]:
	var neighbors = context.board.get_neighbours(cell)
	
	## Create a water essence, depending on neighbors
	
	return []

func _drift_materia(context: TheTurning) -> Array[Shift.Result]:
	var shift = PhaseChange.new(cell, Materia.next_phase(cell.materia.phase))
	
	var r = shift.resolve(context)
	
	return [r]
