extends Area2D
class_name Bubble
export var speed = 100 # Pixels / sec.

func _process(delta_time):
	position.y -= speed * delta_time
	if position.y < 0: queue_free()
	
signal popped

func Pop():
	emit_signal("popped")
	queue_free()

func _on_Bubble_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				Pop() # Pop the Bubble!
				print("Player clicked down.")
			else:
				print("Player clicked up.")
