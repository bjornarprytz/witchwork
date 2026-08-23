class_name Unfold
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
	## TODO: Unfold, depending on the essence and element
	
	print("Unfold: [%s]" % context.cell)
	
	return []