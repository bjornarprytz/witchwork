class_name Pentagram
extends Resource

class Slot:
	var materia: Materia
	func _init(m:Materia) -> void:
		materia = m
	static func empty():
		return Slot.new(null)
	func is_empty() -> bool:
		return materia == null

var _pie: PentaPie
var _intent: Slot
var _threading: Array[Slot] = []
var _grounding: Array[Slot] = []

var _charge: bool
var _potency: int

func _init(inputs: Dictionary[Alignment.Type, Materia]) -> void:
	assert(!inputs.is_empty())
	var slots: Array[Slot] = []
	for a in Alignment.pie:
		if (inputs.has(a)):
			slots.push_back(Slot.new(inputs[a]))
		else:
			slots.push_back(Slot.empty())
	
	_pie = PentaPie.new(slots)
	
	_intent = _find_intent(slots)
	
	_threading = _pie.get_distant_pair(_intent, 1)
	_grounding = _pie.get_distant_pair(_intent, 2)
	
	_charge = _find_charge()
	_potency = _find_potency(slots)

func get_potency() -> int:
	return _potency

func get_intent() -> Materia:
	return _intent.materia

## True: Positive charge
func get_charge() -> bool:
	return _charge

func _find_charge() -> bool:
	var balance := 0
	
	for m in _get_side(0):
		balance -= m.intensity
	for m in _get_side(1):
		balance += m.intensity
	
	if (balance == 0):
		return _intent.materia.intensity % 2 == 0
	
	return balance > 0

func _find_potency(slots: Array[Slot]) -> int:
	var unique_states: Array[MateriaState.Type] = []
	
	for s in slots:
		if (s.is_empty() or unique_states.has(s.materia.state)):
			continue
		
		unique_states.push_back(s.materia.state)
	
	return unique_states.size()

## i=0: left, i=1: right
func _get_side(i: int) -> Array[Materia]:
	assert (i == 0 or i == 1)
	var side: Array[Materia] = []
	
	for slot in [_threading[i], _grounding[i]]:
		if !slot.is_empty():
			side.append(slot)
	
	return side

func _find_intent(slots: Array[Slot])  -> Slot:
	var max_intent := -1
	var current_intent: Slot
	
	for s in slots:
		if (s.is_empty()):
			continue
		var m = s.materia
		if m.intensity < max_intent:
			continue
		elif m.intensity > max_intent:
			current_intent = s
		elif Alignment.compare(m.alignment, current_intent.materia.alignment) > 0:
				current_intent = s
	
	assert(current_intent != null)
	
	return current_intent


	
	
