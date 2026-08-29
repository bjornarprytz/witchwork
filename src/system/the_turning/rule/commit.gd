class_name Commit
extends Rule

var cell: Cell

func _init(cell_: Cell):
	cell = cell_

func resolve_rule(_context: TheTurning) -> Array[Shift.Result]:
	cell.materia = cell.materia_next.copy()
	
	return [] # Special rule, the shift already happened
