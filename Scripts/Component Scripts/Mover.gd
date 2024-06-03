extends Node3D

@export var speed: float
@export var character: Node3D
@export var typeSearcher: Node3D

func _process(delta):
	var direction = typeSearcher.target.position - Vector3(1, 0, 1)
	character.velocity = character.position.direction_to(direction) * speed * delta
	character.move_and_slide()
