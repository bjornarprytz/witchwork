class_name Unfold
extends Rule

var cell: Cell

func _init(cell_: Cell):
	cell = cell_

func resolve_rule(context: TheTurning) -> Array[Shift.Result]:
	if (cell.materia == null || cell.materia.phase != Materia.Phase.Risen):
		return []
	
	var shift = _unfold(context)
	
	if (shift == null):
		return []
	
	return [shift.resolve(context)]

func _unfold(context: TheTurning) -> Shift:
	var neighbours = context.board.get_neighbours(cell)
	
	var elements: Array[Materia.Element] = []
	var essences: Array[Materia.Essence] = []
	var numerology: Array[Array] = []
	var numeric_apex: Array[Cell] = []
	
	for n in neighbours:
		if (n.is_empty()):
			continue
		
		elements.append(n.materia.element)
		essences.append(n.materia.essence)
		
		var numeric_alignment = n.materia.get_numeric_alignment()
		if numeric_apex.is_empty():
			numeric_apex.append(n)
		else:
			var r = Materia.numeric_compare(numeric_apex[0].materia.get_numeric_alignment(), numeric_alignment)
			
			if (r == 0):
				numeric_apex.append(n)
			if (r > 0):
				numeric_apex = [n]
		
		numerology.append(numeric_alignment)
	
	print("Unfold: [%s]" % cell)
	match cell.materia.essence:
		Materia.Essence.Rooted:
			pass
		Materia.Essence.Crystalline:
			pass
		Materia.Essence.Flowing:
			pass
		Materia.Essence.Vital:
			pass
		Materia.Essence.Burnt:
			pass
		Materia.Essence.Threshold:
			var element_values = Materia.Element.values()
			var target_element = element_values[cell.materia.get_numeric_alignment()[0] % element_values.size()]
			for c in numeric_apex:
				return Realign.new(cell, target_element)
		Materia.Essence.Celestial:
			pass
	
	return null
		
