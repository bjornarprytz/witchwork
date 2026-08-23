class_name Drift
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
	## TODO: Drift, depending on the element
	print("Drift: [%s]" % context.cell)
	
	return [PhaseChange.new(context.board, context.cell, Materia.next_phase(context.cell.materia.phase))]
