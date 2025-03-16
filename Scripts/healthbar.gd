extends TextureProgressBar

@export var player: CharacterBody2D

func _ready() -> void:
	player.health_changed.connect(update)
	value = player.health * 100 / 100
	
func update():
	value = player.health * 100 / 100
