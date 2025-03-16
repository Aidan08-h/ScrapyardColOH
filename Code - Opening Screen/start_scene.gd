extends Control



func _on_shaun_pressed() -> void:
	Global.selected_player = "Shaun"  # Store selected name
	
	get_tree().change_scene_to_file("res://Scenes/main.tscn")  # Transition to Loading Screen
	 
func _on_aidan_pressed() -> void:
	Global.selected_player = "Aidan"  # Store selected name
	
	get_tree().change_scene_to_file("res://Scenes/main.tscn")  # Transition to Loading Screen
	 
func _on_wendy_pressed() -> void:
	Global.selected_player = "Wendy"  # Store selected name
	
	get_tree().change_scene_to_file("res://Scenes/main.tscn")  # Transition to Loading Screen
