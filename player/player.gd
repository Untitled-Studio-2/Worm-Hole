extends Node2D

@export var segment_count: int = 20
@export var segment_spacing: float = 32.0
@onready var path_follow : PathFollow2D = $Path/PathFollow
@onready var player : Sprite2D = $Path/PathFollow/Sprite2D
@onready var path : Path2D = $Path
@onready var middle : Line2D = $Middle
@onready var right : Line2D = $Right
@onready var left : Line2D = $Left
var normal : Vector2

@export var distance : int = 16
var dir : Vector2

@export var wall_tile_map : TileMapLayer

var player_map_position : Vector2

func _process(delta):
	player_map_position = wall_tile_map.to_local(player.global_position)
	var points = []
	points = path.curve.get_baked_points()
	
	middle.points = points
	right.points = points
	left.points = points

	
func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		var move_left = Input.get_action_strength("left")
		var move_right = Input.get_action_strength("right")
		var move_up = Input.get_action_strength("up")
		var move_down = Input.get_action_strength("down")
		
		dir.x = move_right - move_left
		dir.y = move_down - move_up
		
		add_point(dir)
	
func add_point(dir : Vector2):
	if dir.x == 0 or dir.y == 0:
		var new_point : Vector2
		new_point = wall_tile_map.to_global(player.global_position + dir)
		if(is_available(dir)):
			path.curve.add_point(new_point)

func is_available(dir : Vector2) -> bool:
	var new_pos : Vector2 = player_map_position + dir
	for pos in path.curve.get_baked_points():
		if wall_tile_map.to_global(new_pos) == pos:
			return false
	if wall_tile_map.get_cell_source_id(new_pos) != 0:
		print("false")
		return false
	return true
