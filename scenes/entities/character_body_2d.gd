extends CharacterBody2D

const tile_size := 32
var moving := false
var input_dir

func _physics_process(delta: float) -> void:
	input_dir = Vector2.ZERO

	# TODO: Use InputMap
	if Input.is_action_pressed("ui_down"):
		input_dir = Vector2(0, 1)
		move()
	elif Input.is_action_pressed("ui_up"):
		input_dir = Vector2(0, -1)
		move()
	elif Input.is_action_pressed("ui_right"):
		input_dir = Vector2(1, 0)
		move()
	elif Input.is_action_pressed("ui_left"):
		input_dir = Vector2(-1, 0)
		move()
	
	move_and_slide()


func move():
	if input_dir:
		if moving == false:
			moving = true
			var tween = create_tween()

			tween.tween_property(
				self, "position", position + input_dir * tile_size, 0.1
				)

			tween.tween_callback(move_false)


func move_false():
	moving = false
