class_name Turn
extends Object

var _board: Board
var is_resolved := false

func _init(board: Board) -> void:
	_board = board

func resolve() -> Array[Shift]:
	assert (!is_resolved)
	
	# Awake Try to rise
	var cells = _board.cells
	
	var reserved_cells: Array[Cell] = []
	var shifts: Array[Shift] = []
	for c in cells:
		if c.materia.phase == Materia.Phase.Awake:
			var r = try_rise(c, reserved_cells)
			if (!r.is_empty()):
				reserved_cells.append_array(r)
				shifts.append(PhaseChange.new(_board, c.materia, Materia.Phase.Risen))

	# Risen materia unfold
	
	# Each materia drift
	
	is_resolved = true
	return shifts

func try_rise(cell: Cell, reserved_cells: Array[Cell]) -> Array[Cell]:
	
	pass

func unfold(cell: Cell):
	pass
