@abstract
class_name Shift
extends Object

class Result:
	var shift: Shift
	var before: Variant
	var after: Variant
	
	func is_noop():
		return before == after

var target: Cell

var _is_resolved := false

func _init(t: Cell) -> void:
	target = t

func resolve(context: TheTurning) -> Result:
	assert(!_is_resolved)
	var r = resolve_shift(context)
	_is_resolved = true
	Events.shift_resolved.emit(r)
	return r

@abstract
func resolve_shift(context: TheTurning) -> Result

func _result(before:Variant, after:Variant) -> Result:
	var r = Result.new()
	r.shift = self;
	r.before = before
	r.after = after
	return r

func _noop() -> Result:
	return _result(null, null)
