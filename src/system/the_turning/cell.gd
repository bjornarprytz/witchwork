class_name Cell
extends Object

var materia: Materia
var coords: Vector2i

func _init(x:int,y:int,m:Materia=null):
	coords = Vector2i(x,y)
	materia = m

func is_empty() -> bool:
	return materia == null
