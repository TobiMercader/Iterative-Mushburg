extends Node3D

func _on_builder_node_child_entered_tree(node):
	print(node)
	for y in (GameState.building_surface.y + 1):
		for x in (GameState.building_surface.x + 1):
			print(x, y)
