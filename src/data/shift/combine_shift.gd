class_name CombineShift
extends Shift


func resolve(input: Array[Materia]) -> Array[Materia]:
	assert(input.size() == 2)
	
	var a = input[0]
	var b = input[1]
	var c = Materia.new()
	
	
	## Keep equidistant essence if both are in the same pie, 
	## otherwise, keep the esoteric one.
	if (Essence.is_basic(a.essence) and Essence.is_basic(b.essence)):
		var basic_essence_pie = Pie.new(Essence.pie_basic)
		c.essence = basic_essence_pie.get_equidistant(a.essence, b.essence)
	elif(Essence.is_esoteric(a.essence) and Essence.is_esoteric(b.essence)):
		var esoteric_essence_pie = Pie.new(Essence.pie_esoteric)
		c.essence = esoteric_essence_pie.get_equidistant(a.essence, b.essence)
	elif Essence.is_esoteric(a.essence):
		c.essence = a.essence
	else:
		c.essence = b.essence
	
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
	
	
