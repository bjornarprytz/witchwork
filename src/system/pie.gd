class_name Pie
extends Resource

## Utility about items relations, e.g. color pie. Only for odd-numbered pies

var _items: Array

func _init(items: Array) -> void:
	assert(items.size() > 2 and items.size() % 2 == 1)
	_items = items

func get_neighbours(item: Variant) -> Array:
	return get_distant_pair(item, 1)

## Gets the items farthest away from the input item
func get_opposites(item: Variant) -> Array:
	var dist = _items.size() / 2
	
	return get_distant_pair(item, dist)

func get_distant_pair(item: Variant, dist: int) -> Array:
	assert(dist > 0 and dist <= (_items.size() / 2))
	
	return [
		get_other(item, -dist),
		get_other(item, dist)
	]

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
