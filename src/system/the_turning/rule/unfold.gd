class_name Unfold
extends Rule

var cell: Cell

func _init(cell_: Cell):
	cell = cell_

func resolve_rule(context: TheTurning) -> Array[Shift.Result]:
	if (cell.materia == null || cell.materia.phase != Materia.Phase.Risen):
		return []
	## TODO: Unfold, depending on the essence and element
	
	print("Unfold: [%s]" % cell)
	
	# Threshold should change elements around it, then self destruct
	# Celestial should do something cool too
	
	return []
