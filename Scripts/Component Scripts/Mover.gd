extends Node3D

@export var speed: float
@export var character: Node3D
@export var typeSearcher: Node3D
var direction

func _process(delta):
	direction = global_position.direction_to(typeSearcher.target.position)
	character.position += direction * speed * delta
