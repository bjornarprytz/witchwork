class_name Cell
extends RefCounted

signal materia_changed(new_materia: Materia)

var materia: Materia:
	set(value):
		if (materia == value):
			return
		materia = value
		materia_changed.emit(materia)
var materia_next: Materia:
	set(value):
		materia_next = value

var coords: Vector2i

func _init(x:int,y:int,m:Materia=null):
	coords = Vector2i(x,y)
	materia = m
	if (m != null):
		materia_next = m.copy()
		pass

func is_empty() -> bool:
	return materia == null

func _to_string() -> String:
	return "%s:%s" % [coords, materia]
