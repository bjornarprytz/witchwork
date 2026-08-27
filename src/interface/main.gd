class_name Game
extends Node2D

@onready var the_turning: TheTurningUI = %TheTurning
@onready var spin_box: SpinBox = %SpinBox

func _ready() -> void:
	the_turning.load_turning(TheTurning.new(5))

func _on_next_turn_pressed() -> void:
	the_turning.next_turn()

func _on_refresh_pressed() -> void:
	the_turning.load_turning(TheTurning.new(int(spin_box.value)))
