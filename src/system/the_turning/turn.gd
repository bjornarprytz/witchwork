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
	var unfolds: Array[Rule] = []
	var settles: Array[Rule] = []
	var drifts: Array[Rule] = []
	var commits: Array[Rule] = []
	
	for c in _board.cells:
		unfolds.append(Unfold.new(c))
		settles.append(Settle.new(c))
		drifts.append(Drift.new(c))
		commits.append(Commit.new(c))
		
	_flush(unfolds)
	_flush(settles)
	_flush(drifts)
	_flush(commits)
	
	is_resolved = true
	Events.turn_ended.emit(self)
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

## Resolve effects, then clear them. Results are added to the turn results
func _flush(effects: Array[Rule]):
	for s in effects:
		shift_results.append_array(s.resolve(_turning).shifts)
	effects.clear()
