extends CanvasLayer

func _on_left_pressed() -> void:
	var left_event = InputEventAction.new()
	left_event.action = "key_left"
	left_event.pressed = true
	Input.parse_input_event(left_event)

func _on_right_pressed() -> void:
	var right_event = InputEventAction.new()
	right_event.action = "key_right"
	right_event.pressed = true
	Input.parse_input_event(right_event)
