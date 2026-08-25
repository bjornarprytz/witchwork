class_name Settle
extends Effect

var cell: Cell

func _init(cell_: Cell):
	cell = cell_

func resolve(context: TheTurning) -> Array[Shift]:
	## TODO: Settle, depending on the essence
	print("Settle: [%s]" % cell)
	
	var shift = [
		null,
		null,
		null,
		Transmutation.new(context.board, cell, Materia.random_essence()),
		Destruction.new(context.board, cell)
	].pick_random()
	
	if (shift == null):
		return []
	
	return [shift]
