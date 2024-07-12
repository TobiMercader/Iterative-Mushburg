extends Camera2D

var rayResult
var mouseWorld

func _process(delta):
	mouseWorld = Vector2i(get_global_mouse_position() / 16)
