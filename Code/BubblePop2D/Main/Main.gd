extends Node

const BUBBLE_PS: PackedScene = preload("res://Bubble (object)/Bubble.tscn")
func _ready():
	var bubble = BUBBLE_PS.instance() # Ask for memory.
	bubble.position = Vector2(600, 500)
	add_child(bubble)


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Start(), BeginPlay()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	SpawnBubble() # Spawn a new instance of Bubble.

func SpawnBubble():
	# Randomize the seed for Godot's random number generator.
	randomize()
	var viewport_width = get_viewport().size.x # 1024 px
	var viewport_height = get_viewport().size.y # 600 px
	var random_x: int = rand_range(0, get_viewport().size.x)
	# Ask for enough memory to create a Bubble instance.
	# Move the instance's position to a random point.
	# along the bottom of the viewport.
	# Present the instance to screen by adding as a child.
	# of the game's node tree.
	var bubble_instance = BUBBLE_PS.instance()
	bubble_instance.position = Vector2(random_x, viewport_height + 200)
	add_child(bubble_instance)
