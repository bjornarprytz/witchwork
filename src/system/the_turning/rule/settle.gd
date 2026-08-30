class_name Settle
extends Rule

var cell: Cell

func _init(cell_: Cell):
	cell = cell_

func resolve_rule(context: TheTurning) -> Array[Shift.Result]:
	if (cell.materia == null || cell.materia.phase != Materia.Phase.Risen):
		return []
	
	print("Settle: [%s]" % cell)
	
	var shift = _determine_fate(context.board.get_neighbours(cell))	
	
	if (shift == null):
		return []
	
	var r = shift.resolve(context)
	
	return [r]

func _determine_fate(neighbours: Array[Cell]) -> Shift:
	var elements: Array[Materia.Element] = []
	var essences: Array[Materia.Essence] = []
	
	for n in neighbours:
		if (n.is_empty()):
			continue
		
		elements.append(n.materia.element)
		essences.append(n.materia.essence)
	
	match cell.materia.essence:
		Materia.Essence.Rooted:
			if (essences.count(Materia.Essence.Rooted) == 4): # Petrification
				return Transmutation.new(cell, Materia.Essence.Crystalline)
			if (cell.materia.element != Materia.Element.Fire && elements.count(Materia.Element.Fire) > 0): # Purge
				return Transmutation.new(cell, Materia.Essence.Burnt)
			if (essences.size() == 3): # Evolution
				return Transmutation.new(cell, Materia.Essence.Vital)
			return null
		Materia.Essence.Crystalline:
			if (essences.count(Materia.Essence.Crystalline) > 1): # Crumble
				return Transmutation.new(cell, Materia.Essence.Burnt)
			return null
		Materia.Essence.Flowing:
			if (neighbours.size() < 3): # Free Flow
				return null
			var next_essence := Materia.random_essence([Materia.Essence.Flowing]) # Chaos
			return Transmutation.new(cell, next_essence)
		Materia.Essence.Vital:
			if (cell.materia.age > 10): # Old age
				return Transmutation.new(cell, Materia.Essence.Rooted)
			if (essences.count(Materia.Essence.Vital) > 2): # Competition
				return Transmutation.new(cell, Materia.Essence.Burnt)
			return null
		Materia.Essence.Burnt:
			if (cell.materia.age > 12): # 
				return Transmutation.new(cell, Materia.Essence.Threshold)
		Materia.Essence.Threshold:
			return null
		Materia.Essence.Celestial:
			return null
	
	return null
	
	
	
	
	
	
	
	
	
	
