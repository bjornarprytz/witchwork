class_name TheTurning
extends RefCounted

## The environment
var board: Board
var _width: int
var _height: int
var _turn_number: int = 0

func turn() -> Turn:
	_turn_number += 1
	var t = Turn.new(_turn_number, self)
	t.resolve()
	return t

func _init(size:int):
	board = Board.new(size,size)
	_seed_materia()

func _seed_materia():
	for x in range(_width):
		for y in range(_height):
			board.add(Cell.new(x,y,Materia.random()))
