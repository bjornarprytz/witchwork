class_name Game
extends Node2D

@onready var the_turning: TheTurningUI = %TheTurning

func _ready() -> void:
	the_turning.load_turning(TheTurning.new(5))
