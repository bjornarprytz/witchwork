class_name Settle
extends Object

class Context:
	var cell: Cell
	var board: Board

	func _init(cell_: Cell, board_: Board):
		cell = cell_
		board = board_

var context: Context

func _init(c: Context):
	context = c


func resolve() -> Array[Shift]:
	## TODO: Settle, depending on the essence
	print("Settle: [%s]" % context.cell)
	
	var shift = [
		null,
		null,
		null,
		Transmutation.new(context.board, context.cell, Materia.random_essence()),
		Destruction.new(context.board, context.cell)
	].pick_random()
	
	if (shift == null):
		return []
	
	return [shift]
