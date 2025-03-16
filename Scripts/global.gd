extends Node

var selected_player = "Shaun"  # Variable to store data
var health
var attack = [0, 0]
var animation = []

func _ready() -> void:
	if selected_player == "Shaun":
		animation.append("Shaun_attack_high")
		animation.append("Shaun_attack_low")
		animation.append("Shuan_crouch")
		attack[0] = 10
		attack.append(5)
		health = 100

	if selected_player == "Aidan":
		animation.append("Aidan_attack_high")
		animation.append("Aidan_attack_low")
		animation.append("Aidan_crouch")
		attack.append(10)
		attack.append(15)
		health = 100

	if selected_player == "Wendy":
		animation.append("Wendy_attack_high")
		animation.append("Wendy_attack_low")
		animation.append("Wendy_crouch")
		attack.append(10)
		attack.append(10)
		health = 100
