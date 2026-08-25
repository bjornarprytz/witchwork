@abstract
class_name Shift
extends Object

class Result:
	var shift: Shift
	var before: Variant
	var after: Variant

var board: Board
var target: Cell

var _is_resolved := false

func _init(b: Board, t: Cell) -> void:
	board = b
	target = t

func resolve() -> Result:
	assert(!_is_resolved)
	var r = resolve_shift()
	_is_resolved = true
	return r

@abstract
func resolve_shift() -> Result

func _result(before:Variant, after:Variant) -> Result:
	var r = Result.new()
	r.shift = self;
	r.before = before
	r.after = after
	return r

func _noop() -> Result:
	return _result(null, null)
