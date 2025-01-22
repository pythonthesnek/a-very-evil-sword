extends CharacterBody2D

@onready var tile_map_layer = $"../TileMapLayer"

func _process(delta: float) -> void:
	if Input.is_action_pressed("up"):
		move(Vector2.UP)
	elif Input.is_action_pressed("down"):
		move(Vector2.DOWN)
	elif Input.is_action_pressed("left"):
		move(Vector2.LEFT)
	elif Input.is_action_pressed("right"):
		move(Vector2.RIGHT)


func move(direction: Vector2):
	# Get current tile Vector2i
	var current_tile: Vector2i = tile_map_layer.local_to_map(global_position)
	# Get target tile Vector2i
	var target_tile: Vector2i = Vector2i(
		current_tile.x + direction.x,
		current_tile.y + direction.y,
	)
	print(current_tile, target_tile)
	# Get custom data layer for target tile

	# Move player
