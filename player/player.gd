extends TileMapLayer
var pos : Vector2i = Vector2.ZERO
var tile_id : int = 0
@export var wall_tile_map : TileMapLayer
var positions : Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func move(dir : Vector2i) -> bool:
	if get_cell_source_id(pos+dir) == -1 and wall_tile_map.get_cell_source_id(pos+dir) == -1:
		pos += dir
		set_cell(pos, 1, Vector2i(0,0))
		positions.append(pos)
		return true
	if positions.size() > 1 and pos + dir == positions[positions.size() - 2]:
		set_cell(pos, -1, Vector2i(0,0))
		pos += dir
		positions.pop_back()
	return false
	
func _input(event: InputEvent) -> void:
	move(input())

func input() -> Vector2i:
	
	var dir : Vector2i = Vector2i.ZERO
	
	if Input.is_action_just_pressed("right"):
		dir.x = 1
	elif  Input.is_action_just_pressed("left"):
		dir.x = -1
	elif  Input.is_action_just_pressed("down"):
		dir.y = 1
	elif Input.is_action_just_pressed("up"):
		dir.y = -1
	else:
		return Vector2i.ZERO
	return dir
