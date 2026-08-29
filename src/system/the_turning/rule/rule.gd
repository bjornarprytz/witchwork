@abstract
## Interface for the effects in the turning
class_name Rule
extends Object

var _is_resolved = false

class Result:
	var rule: Rule
	var shifts: Array[Shift.Result]
	
	func is_noop():
		return shifts.is_empty()

func resolve(context: TheTurning) -> Result:
	assert(!_is_resolved)
	
	var shift_results = resolve_rule(context)
	var r = _result(shift_results)
	_is_resolved = true
	Events.rule_resolved.emit(r)
	return r

@abstract
func resolve_rule(context: TheTurning) -> Array[Shift.Result]

func _result(shifts: Array[Shift.Result]) -> Result:
	var r = Result.new()
	r.rule = self
	r.shifts = shifts
	return r
