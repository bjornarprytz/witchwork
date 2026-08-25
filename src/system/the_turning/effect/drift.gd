class_name Drift
extends Effect

var cell: Cell

func _init(cell_: Cell):
	cell = cell_

func resolve(context: TheTurning) -> Array[Shift]:
	## TODO: Drift, depending on the element
	print("Drift: [%s]" % cell)
	
	return [PhaseChange.new(context.board, cell, Materia.next_phase(cell.materia.phase))]
