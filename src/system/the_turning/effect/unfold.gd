class_name Unfold
extends Effect

var cell: Cell

func _init(cell_: Cell):
	cell = cell_

func resolve_effect(context: TheTurning) -> Array[Shift.Result]:
	## TODO: Unfold, depending on the essence and element
	
	print("Unfold: [%s]" % cell)
	
	# TODO: Examine this. The settling should follow the materia, not the cell
	var settle = Settle.new(cell)
	var settle_results = settle.resolve(context)
	return settle_results.shifts
