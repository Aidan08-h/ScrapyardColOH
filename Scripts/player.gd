extends CharacterBody2D

@onready var animation_player := $AnimationPlayer
@onready var animated_sprite := $AnimatedSprite2D
const SPEED = 600.0
const JUMP_VELOCITY = -2000.0
const gravity =Vector2(0, 10000.0)
var health = 100
var height
var pos
signal health_changed
var animation = Global.animation

func _enter_tree() -> void:
	set_multiplayer_authority(int(str(name)))

func _ready() -> void:
	height = $CollisionShape2D.shape.height
	pos = $CollisionShape2D.position

func take_damage(amount: int) -> void:
	health -= amount
	print("damage: ", amount)
	self.health_changed.emit()
	
func high_attack():
	$Hitbox.damage = Global.attack[0] 
	if Input.is_action_pressed("attack_high"):
		play_animation(animation[0])
		
func low_attack():
	$Hitbox.damage = Global.attack[1]
	if Input.is_action_pressed("attack_low"):
		play_animation(animation[1])
	
func crouch():
	var crouch = height
	var crouch_pos = pos.y
	if Input.is_action_pressed("crouch") and is_on_floor() and !animation_player.is_playing():
		play_animation(animation[2])
		animation
		crouch /= 2
		crouch_pos = pos.y + (height / 4)
	$CollisionShape2D.shape.height = crouch
	$CollisionShape2D.position.y = crouch_pos
	$Hurtbox/Hurt.position.y = crouch_pos
	
func play_animation(animation: String):
	animated_sprite.play(animation)
	animation_player.play(animation)
	
func _physics_process(delta: float) -> void:
	if !is_multiplayer_authority():
		return
	# Add the gravity.
	if not is_on_floor():
		velocity += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle athe movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		if direction < 0:
			self.scale = Vector2(-1, 1)
		if direction > 0:
			self.scale =Vector2(1, 1)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	low_attack()
	crouch()
	high_attack()
	move_and_slide()
