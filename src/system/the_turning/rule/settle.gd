class_name Settle
extends Rule

var cell: Cell

func _init(cell_: Cell):
	cell = cell_

func resolve_rule(context: TheTurning) -> Array[Shift.Result]:
	if (cell.materia == null || cell.materia.phase != Materia.Phase.Risen):
		return []
	
	print("Settle: [%s]" % cell)
	
	var shift = [
		null,
		null,
		null,
		Transmutation.new(cell, Materia.random_essence()),
		Destruction.new(cell)
	].pick_random()
	
	if (shift == null):
		return []
	
	var r = shift.resolve(context)
	
	return [r]
