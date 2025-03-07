extends TileMapLayer
var pos : Vector2i = Vector2.ZERO
var tile_id : int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move(input())
	
func move(dir : Vector2i) -> bool:
	if get_cell_source_id(pos+dir) == -1:
		pos += dir
		set_cell(pos, 1, Vector2i(0,0))
		return true
	return false

func input() -> Vector2i:
	
	var dir : Vector2i = Vector2i.ZERO
	
	if Input.is_action_just_pressed("right"):
		dir.x = 1
		return dir
	elif  Input.is_action_just_pressed("left"):
		dir.x = -1
		return dir
	elif  Input.is_action_just_pressed("down"):
		dir.y = 1
		return dir
	elif Input.is_action_just_pressed("up"):
		dir.y = -1
		return dir
	else:
		return Vector2i.ZERO
