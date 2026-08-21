class_name Turn
extends Object

var _board: Board

var number: int

var shift_results: Array[Shift.Result] = []

var is_resolved := false

func _init(board: Board, turn_number: int) -> void:
	_board = board
	number = turn_number

func resolve() -> Array[Shift.Result]:
	assert (!is_resolved)
	var reserved_cells: Array[Cell] = []
	var shifts: Array[Shift] = []
	var cells = _board.cells
	
	# Awake Try to rise
	
	for c in cells:
		if c.materia.phase == Materia.Phase.Awake:
			var r = try_rise(c, reserved_cells)
			if (!r.is_empty()):
				reserved_cells.append_array(r)
				shifts.append(PhaseChange.new(_board, c.materia, Materia.Phase.Risen))
	
	_flush(shifts)
	
	# Risen materia unfold, then settle
	for c in cells:
		if c.materia.phase == Materia.Phase.Risen:
			shifts.append_array(unfold(c))
	
	_flush(shifts)
	
	# Each materia drift
	for c in cells:
		shifts.append_array(drift(c))
	
	_flush(shifts)
	
	is_resolved = true
	return shift_results

## Returns reserved cells if cell can rise
func try_rise(cell: Cell, reserved_cells: Array[Cell]) -> Array[Cell]:
	## TODO: Should be optimizable
	if (reserved_cells.has(cell)):
		return [] # 
	var neighbours = _board.get_neighbours(cell)
	
	for n in neighbours:
		if (reserved_cells.has(n)):
			return []
	
	neighbours.append(cell)
	
	return neighbours

func unfold(cell: Cell) -> Array[Shift]:
	## TODO: Unfold, depending on the essence and element
	return []

func settle(cell: Cell) -> Array[Shift]:
	## TODO: Settle, depending on the essence
	return []

func drift(cell: Cell) -> Array[Shift]:
	## TODO: Drift, depending on the element
	return []

## Resolve shifts, then clear them. Results are added to the turn results
func _flush(shifts: Array[Shift]):
	for s in shifts:
		shift_results.append(s.resolve())
	shifts.clear()
