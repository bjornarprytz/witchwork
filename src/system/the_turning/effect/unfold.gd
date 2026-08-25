class_name Unfold
extends Effect

var cell: Cell

func _init(cell_: Cell):
	cell = cell_

func resolve(_context: TheTurning) -> Array[Shift]:
	## TODO: Unfold, depending on the essence and element
	
	print("Unfold: [%s]" % cell)
	
	return []
