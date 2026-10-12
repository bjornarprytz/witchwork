class_name PentaPie
extends Pie

func _init(items: Array) -> void:
	assert(items.size() == 5)
	super._init(items)


func get_equiguy(a: Variant, b:Variant) -> Variant:
	var n_a = get_neighbours(a)
	var n_b = get_neighbours(b)
	var o_a = get_opposites(a)
	var o_b = get_opposites(b)
	
	if (n_a.has(b)): # A and B are neighbours
		for i in o_b:
			if (o_a.has(i)):
				return i
		push_error("Should have found equiguy among opposites")
	else: 
		for i in n_b:
			if (n_a.has(i)):
				return i
		push_error("Should have found equiguy among neighbours")
	
	push_error("Should have found equiguy for a an b")
	return null
		
func get_leftguy(a: Variant, b: Variant) -> Variant:
	var n_a = get_neighbours(a)
	var n_b = get_neighbours(b)
	var o_a = get_opposites(a)
	var o_b = get_opposites(b)
	
	if (n_a.has(b)): # A and B are neighbours
		for i in o_b:
			if (!o_a.has(i)):
				return i
		push_error("Should have found leftguy among opposites")
	else:
		for i in n_b:
			if (!n_a.has(i)):
				return i
		push_error("Should have found leftguy among neighbours")
	
	push_error("Should have found leftguy for a an b")
	return null
	
func get_rightguy(a: Variant, b: Variant) -> Variant:
	var n_a = get_neighbours(a)
	var n_b = get_neighbours(b)
	var o_a = get_opposites(a)
	var o_b = get_opposites(b)
	
	if (n_a.has(b)): # A and B are neighbours
		for i in o_a:
			if (!o_b.has(i)):
				return i
		push_error("Should have found rightguy among opposites")
	else:
		for i in n_a:
			if (!n_b.has(i)):
				return i
		push_error("Should have found rightguy among neighbours")
	
	push_error("Should have found rightguy for a an b")
	return null
