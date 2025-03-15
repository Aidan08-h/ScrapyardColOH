extends CharacterBody2D

@onready var animation_player := $AnimationPlayer
@onready var animated_sprite := $AnimatedSprite2D
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func take_damage(amount: int) -> void:
	print("Damage: ", amount)
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle athe movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_pressed("crouch") and is_on_floor():
		var shape = $CollisionShape2D.shape
		shape.set_size(Vector2(shape.size.x, shape.size.y / 2))
	
	if Input.is_action_pressed("attack_high"):
		animated_sprite.play("shaun_attacking_high")
		animation_player.play("attack_high")
		

	move_and_slide()
