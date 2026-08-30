class_name Game
extends Node2D

@onready var the_turning: TheTurningUI = %TheTurning
@onready var spin_box: SpinBox = %SpinBox

var play_tween : Tween

func _ready() -> void:
	the_turning.load_turning(TheTurning.new(5))

func _on_next_turn_pressed() -> void:
	the_turning.next_turn()

func _on_refresh_pressed() -> void:
	the_turning.load_turning(TheTurning.new(int(spin_box.value)))

func _on_play_pressed() -> void:
	if (!play_tween):
		play_tween = create_tween()
		play_tween.tween_interval(.2)
		play_tween.set_loops().tween_callback(the_turning.next_turn)
		
	else:
		play_tween.stop()
		play_tween = null
		
	
