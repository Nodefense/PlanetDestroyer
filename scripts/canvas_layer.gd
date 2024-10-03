extends CanvasLayer

func _on_left_pressed() -> void:
	var left_event = InputEventAction.new()
	left_event.action = "key_left"
	left_event.pressed = true
	Input.parse_input_event(left_event)
	print("LEFT")

func _on_right_pressed() -> void:
	Input.action_press("key_right")
