extends Node3D

@onready var builder = get_node("BuilderNode")
var building_positions: Array

func _on_builder_node_child_entered_tree(node):
	#this gets you two vectors that indicate the surface the building spans through
	var building_occupied_x = Vector2(builder.mouseWorld.x, builder.mouseWorld.x - GameState.building_surface.x + 1)
	var building_occupied_y = Vector2(builder.mouseWorld.y, builder.mouseWorld.y - GameState.building_surface.y + 1)
	var AABBlimits = Rect2i(builder.mouseWorld - GameState.building_surface + Vector2i(1,1), GameState.building_surface)
	building_positions.append(AABBlimits)
	if(building_positions.size() >= 2):
		pass
		#if(building_positions[building_positions.size() - 1].intersects(building_positions[building_positions.size()-2])):
			
