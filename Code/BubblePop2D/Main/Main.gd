extends Node

onready var HI_SCORE_UI = $Control/HiScore
onready var PLAYER_SCORE_UI = $Control/PlayerScore
onready var BUBBLE_NODE = $Bubbles

const BUBBLE_PS: PackedScene = preload("res://Bubble (object)/Bubble.tscn")

var hi_score: int
var current_score: int

func _ready():
	# TODO: Load Hi Score.
	hi_score = 10
	HI_SCORE_UI.text = "Hi Score: \n%s" % hi_score

func _on_Timer_timeout():
	SpawnBubble() # Spawn a new instance of Bubble.

func SpawnBubble():
	# Randomize the seed for Godot's random number generator.
	randomize()
	var rando: int = rand_range(0, get_viewport().size.x)
	var viewport_width = get_viewport().size.x # 1024 px
	var viewport_height = get_viewport().size.y # 600 px

	var bubble = BUBBLE_PS.instance() # Ask for memory.
	bubble.position = Vector2(rando, get_viewport().size.y + 200)
	bubble.connect("popped", self, "UpdatePlayerScore")
	BUBBLE_NODE.add_child(bubble)
	
func UpdatePlayerScore():
	current_score += 1
	PLAYER_SCORE_UI.text = str(current_score)
	if current_score > hi_score:
		hi_score = current_score
		HI_SCORE_UI.text = "Hi Score: \n%s" % hi_score
