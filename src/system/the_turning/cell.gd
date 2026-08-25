class_name Cell
extends RefCounted

signal materia_changed(new_materia: Materia)

var materia: Materia:
	set(value):
		materia = value
		materia_changed.emit(value)

var coords: Vector2i

func _init(x:int,y:int,m:Materia=null):
	coords = Vector2i(x,y)
	materia = m

func is_empty() -> bool:
	return materia == null

func _to_string() -> String:
	return "%s:%s" % [coords, materia]
