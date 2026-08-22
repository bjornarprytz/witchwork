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
			if (try_reserve_neighbours(c, reserved_cells)):
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

## Returns reserved cells
func try_reserve_neighbours(cell: Cell, reserved_cells: Array[Cell]) -> bool:
	## TODO: Should be optimizable
	if (reserved_cells.has(cell)):
		return false
	var neighbours = _board.get_neighbours(cell)
	
	for n in neighbours:
		if (reserved_cells.has(n)):
			return false
	
	neighbours.append(cell)
	
	reserved_cells.append_array(neighbours)
	
	return neighbours

func unfold(cell: Cell) -> Array[Shift]:
	## TODO: Unfold, depending on the essence and element
	
	print("Unfold: [%s]" % cell)
	
	return []

func settle(cell: Cell) -> Array[Shift]:
	## TODO: Settle, depending on the essence
	
	print("Settle: [%s]" % cell)
	
	var shift = [
		null,
		null,
		null,
		Transmutation.new(_board, cell, Materia.random_essence()),
		Destruction.new(_board, cell)
	].pick_random()
	
	if (shift == null):
		return []
	
	return [shift]

func drift(cell: Cell) -> Array[Shift]:
	## TODO: Drift, depending on the element
	return [PhaseChange.new(_board, cell, Materia.next_phase(cell.materia.phase))]

## Resolve shifts, then clear them. Results are added to the turn results
func _flush(shifts: Array[Shift]):
	for s in shifts:
		shift_results.append(s.resolve())
	shifts.clear()
