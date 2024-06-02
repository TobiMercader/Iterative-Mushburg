extends Node3D

@export var targetType: StringName
var target

@onready var available_types = get_tree().get_nodes_in_group(targetType)

func _search_type(index):
	target = available_types[index]
	print(target)
