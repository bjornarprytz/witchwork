class_name Pie
extends Resource
@warning_ignore_start("integer_division")

## Utility about items relations, e.g. color pie. Only for odd-numbered pies

var _items: Array

func _init(items: Array) -> void:
	assert(items.size() > 2 and items.size() % 2 == 1)
	_items = items

## Examine the items between a and b (inner and outer). Only one item is equidistant
## from a and b, and it will be in the middle of the group with an odd number of items.
func get_equidistant(a: Variant, b: Variant) -> Variant:
	if (a == b):
		return a
	
	## a [] b
	var mid_index: int = -1
	var inner_group = _get_intermediate_items(a, b)

	if (inner_group.size() % 2 == 1):
		mid_index = inner_group.size() / 2
		return inner_group[mid_index]
	
	## ] a b [
	var outer_group = _get_intermediate_items(b, a)
	
	assert(outer_group.size() % 2 == 1, "One of the groups must be odd-numbered")

	mid_index = outer_group.size() / 2
	return outer_group[mid_index]

func _get_intermediate_items(from: Variant, to: Variant) -> Array[Variant]:
	assert (_items.has(from) and _items.has(to))
	
	var group = []
	
	var next: Variant = get_next(from)
	
	while next != to:
		assert (group.size() < _items.size())
		
		group.push_back(next)
		next = get_next(next)
	
	return group

func get_neighbours(item: Variant) -> Array:
	return get_distant_pair(item, 1)

## Gets the items farthest away from the input item
func get_opposites(item: Variant) -> Array:
	var dist = _items.size() / 2
	
	return get_distant_pair(item, dist)

func get_distant_pair(item: Variant, dist: int) -> Array:
	assert(dist > 0 and dist <= (_items.size() / 2))
	
	var a = get_other(item, -dist)
	var b = get_other(item, dist)
	assert (a != b)
	
	return [a,b]

func get_next(item: Variant) -> Variant:
	return get_other(item, 1)

func get_prev(item: Variant) -> Variant:
	return get_other(item, -1)

func get_other(item: Variant, step: int) -> Variant:
	assert(step != 0)
	var i = _items.find(item)
	assert(i >= 0)
	
	i = (i+step) % _items.size()
	
	return _items[i]
