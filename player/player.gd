extends TileMapLayer
var dir : Vector2i
var pos : Vector2i = Vector2.ZERO
var tile_id : int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if input():
		print("true")
		if get_cell_source_id(pos+dir) == -1:
			pos += dir
			set_cell(pos, 1, Vector2i(0,0))
	print(to_local(pos))


func input() -> bool:
	dir.x = 0
	dir.y = 0
	if Input.is_action_just_pressed("right"):
		dir.x = 1
		pos.x += 1
		return true
	elif  Input.is_action_just_pressed("left"):
		dir.x = -1
		pos.x += -1
		return true
	elif  Input.is_action_just_pressed("down"):
		dir.y = 1
		pos.y += 1
		return true
	elif Input.is_action_just_pressed("up"):
		dir.y = -1
		pos.y += -1
		return true
	else:
		return false
