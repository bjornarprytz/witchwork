class_name Commit
extends Rule

var cell: Cell

func _init(cell_: Cell):
	cell = cell_

func resolve_rule(_context: TheTurning) -> Array[Shift.Result]:
	if (cell.queue_destruction):
		cell.materia = null
		cell.materia_next = null
		cell.queue_destruction = false
	else:
		cell.materia = cell.materia_next.copy()
	
	return [] # Special rule, the shift already happened
