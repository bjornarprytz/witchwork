class_name CombineShift
extends Shift


func resolve(input: Array[Materia]) -> Array[Materia]:
	assert(input.size() == 2)
	
	var a = input[0]
	var b = input[1]
	var c = Materia.new()
	
	# Union of essences
	c.essences.append_array(a.essences)
	for e in b.essences:
		if !c.essences.has(e):
			c.essences.push_back(e)
	
	c.intensity = min(a.intensity, b.intensity)
	
	if (a.alignment == b.alignment):
		c.alignment = a.alignment
	else:
		var pie = PentaPie.new(Alignment.pie)
		
		if (a.intensity == b.intensity):
			c.alignment = pie.get_equiguy(a.alignment, b.alignment)
		elif (a.intensity > b.intensity):
			c.alignment = pie.get_leftguy(a.alignment, b.alignment)
		else:
			c.alignment = pie.get_rightguy(a.alignment, b.alignment)
	
	return [c]
	
	
