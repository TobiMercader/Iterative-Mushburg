extends Node3D

@export var typeSearcher: Node3D
@export var main: Node3D
@export var mover: Node3D

func _attack():
	var attack = Attack.new()
	attack.attack_damage = 8
	main.position = main.position - mover.direction
	typeSearcher.target.damage(attack)
