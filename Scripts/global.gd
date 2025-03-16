extends Node

var selected_player = ""  # Variable to store data
var health = 100
var attack
var heal

func _ready() -> void:
	if selected_player == "Shaun":
		attack = 15
		heal = 15

	if selected_player == "Aidan":
		attack = 25
		heal = 5

	if selected_player == "Wendy":
		attack = 10
		heal = 15
