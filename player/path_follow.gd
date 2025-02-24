extends PathFollow2D

@export var speed : float = 100.0
var offset : float = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	offset += speed * delta
	progress_ratio = offset
	
