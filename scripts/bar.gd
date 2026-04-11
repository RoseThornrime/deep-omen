extends CenterContainer


signal update_health(amount)
signal reset


@export var value: float = 100.0


func _ready() -> void:
	connect("update_health", Callable(self, "_on_update_health"))
	connect("reset", Callable(self, "_on_reset"))


func _on_update_health(_value: float) -> void:
	var tween = create_tween()
	if value>_value:
		value = _value
		$UnderBar2.value=value
		tween.tween_property($OverBar, "value", value, 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property($UnderBar, "value", value, 0.25).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	else:
		value = _value
		tween.tween_property($UnderBar2, "value", value, 0.25).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		tween.tween_property($OverBar, "value", value, 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property($UnderBar, "value", value, 0.1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)


func _on_reset() -> void:
	value = 100
	$OverBar.value=100
	$UnderBar.value=100
	$UnderBar2.value=100

# Przycisk do testowania
func _on_button_button_down() -> void:
	if value>0:
		_on_update_health(max(value-10,0))
	else:
		_on_update_health(90)
