class_name Turn
extends Object

var _turning: TheTurning

var _board: Board: 
	get:
		return _turning.board

var number: int

var shift_results: Array[Shift.Result] = []

var is_resolved := false

func _init(turn_number: int, turning: TheTurning) -> void:
	number = turn_number
	_turning = turning

func resolve() -> Array[Shift.Result]:
	print("Starting turn #%d" % number)
	assert (!is_resolved)
	var unfold_shifts: Array[Shift] = []
	var settle_shifts: Array[Shift] = []
	var drift_shifts: Array[Shift] = []
	var cells = _board.cells
	
	# Risen materia unfold, then settle
	for c in cells:
		if c.materia == null:
			continue
		if c.materia.phase == Materia.Phase.Risen:
			unfold_shifts.append_array(_unfold(c))
			settle_shifts.append_array(_settle(c))
		drift_shifts.append_array(_drift(c))
	
	_flush(unfold_shifts)
	_flush(settle_shifts)
	_flush(drift_shifts)
	
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

func _unfold(cell: Cell) -> Array[Shift]:
	var unfold = Unfold.new(cell)
	return unfold.resolve(_turning)

func _settle(cell: Cell) -> Array[Shift]:
	var settle = Settle.new(cell)
	return settle.resolve(_turning)

func _drift(cell: Cell) -> Array[Shift]:
	var drift = Drift.new(cell)
	return drift.resolve(_turning)

## Resolve shifts, then clear them. Results are added to the turn results
func _flush(shifts: Array[Shift]):
	for s in shifts:
		shift_results.append(s.resolve())
	shifts.clear()
