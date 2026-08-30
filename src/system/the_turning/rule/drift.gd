class_name Drift
extends Rule

var cell: Cell

func _init(cell_: Cell):
	cell = cell_

func resolve_rule(context: TheTurning) -> Array[Shift.Result]:
	## TODO: Drift, depending on the element
	print("Drift: [%s]" % cell)
	
	if (cell.is_empty()):
		return _drift_empty_cell(context)
	
	return _drift_materia(context)

func _drift_empty_cell(context: TheTurning) -> Array[Shift.Result]:
	var neighbors = context.board.get_neighbours(cell)
	
	var n_neighbors:int = 0
	
	for c in neighbors:
		if !c.is_empty():
			n_neighbors += 1
	
	if n_neighbors == 3:
		var m = Materia.random()
		m.essence = Materia.Essence.Flowing
		var shift = Creation.new(cell, m)
		return [shift.resolve(context)]
	
	
	return []

func _drift_materia(context: TheTurning) -> Array[Shift.Result]:
	var next_phase: Materia.Phase
	
	match cell.materia.element:
		Materia.Element.Water:
			next_phase = _flowing_next_phase(context.board.get_neighbours(cell))
		_:
			next_phase = _next_phase(cell.materia.phase)
	
	var shift = PhaseChange.new(cell, next_phase)
	
	return [shift.resolve(context)]

func _flowing_next_phase(cells: Array[Cell]) -> Materia.Phase:
	var r: Dictionary[Materia.Phase, int] = {}
	
	var current_majority: int = 0
	var has_clear_majority: bool
	var majority_phase: Materia.Phase
	
	for c in cells:
		if c.is_empty():
			continue
		var p = c.materia.phase
		if r.has(p):
			r[p] += 1
		else:
			r[p] = 1
		
		if (r[p] == current_majority):
			has_clear_majority = false
		if (r[p] > current_majority):
			current_majority = r[p]
			has_clear_majority = true
			majority_phase = p

	if (has_clear_majority):
		print("Found MAJORITY: %s (%d)" % [Materia.Phase.keys()[majority_phase], current_majority])
		return majority_phase
	print("Found NO majority")
	
	return _next_phase(cell.materia.phase)

static func _next_phase(current: Materia.Phase) -> Materia.Phase:
	match current:
		Materia.Phase.Dormant:
			return Materia.Phase.Awake
		Materia.Phase.Awake:
			return Materia.Phase.Risen
		Materia.Phase.Risen:
			return Materia.Phase.Dormant
		_:
			push_error("Unrecognized phase: %s" % current)
			return Materia.Phase.Dormant
	
	
