extends Area2D

export var speed = 100 # Pixels / sec.

func _process(delta_time):
	position.y -= speed * delta_time
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func Pop():
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
# Bubble Input
func _on_Bubble_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				Pop() # Pop the Bubble!
				print("Player clicked down.")
			else:
				print("Player clicked up.")
