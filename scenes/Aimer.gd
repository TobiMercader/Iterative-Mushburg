extends Node3D

@export var range: float
@export var typeSearcher: Node3D
@export var Attacker: Node3D

func _process(delta):
	if global_position.distance_to(typeSearcher.target.position) <= range:
		Attacker._attack()
