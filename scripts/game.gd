extends Node2D

var fauna=50
var ppl=50
var chaos=50
var power=50

func update_fauna(value):
	fauna+=value
	$Bar.emit_signal("update_health", fauna)

func update_ppl(value):
	ppl+=value
	$Bar2.emit_signal("update_health", ppl)

func update_chaos(value):
	chaos+=value
	$Bar3.emit_signal("update_health", chaos)

func update_power(value):
	power+=value
	$Bar4.emit_signal("update_health", power)

func _on_button_button_down() -> void:
	update_fauna(-10)

func _on_button_2_button_down() -> void:
	update_fauna(10)
	
