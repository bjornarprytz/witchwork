@abstract
## Interface for the effects in the turning
class_name Effect
extends Object

var _is_resolved = false

class Result:
	var effect: Effect
	var shifts: Array[Shift.Result]
	
	func is_noop():
		return shifts.is_empty()

func resolve(context: TheTurning) -> Result:
	assert(!_is_resolved)
	
	var shift_results = resolve_effect(context)
	var r = _result(shift_results)
	_is_resolved = true
	Events.effect_resolved.emit(r)
	return r

@abstract
func resolve_effect(context: TheTurning) -> Array[Shift.Result]

func _result(shifts: Array[Shift.Result]) -> Result:
	var r = Result.new()
	r.effect = self
	r.shifts = shifts
	return r
