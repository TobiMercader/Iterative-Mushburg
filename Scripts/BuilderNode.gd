extends Node

@onready var camera = $"../WorldCamera"

var building_positions: Array
var current_rect

var building = preload("res://scenes/node_wall.tscn")
var building_surface = [Vector2i.ZERO]

func _input(event):
	if Input.is_key_pressed(KEY_1):
		building = preload("res://scenes/test_building.tscn")
		building_surface = [Vector2i(0, 0), Vector2i(-1, 0), Vector2i(0, -1), Vector2i(-1, -1)]
	elif Input.is_key_pressed(KEY_2):
		building = preload("res://scenes/node_wall.tscn")
		building_surface = [Vector2i.ZERO]
	elif Input.is_key_pressed(KEY_3):
		building = preload("res://scenes/troop_node.tscn")
		building_surface = [Vector2i.ZERO]
	
	if event.is_action_pressed("left_mouse"):
		
		var is_placeable = true
		#converts the float axis into hole numbers
		var relativeSurface = building_surface.map(func(absolute): return absolute + camera.mouseWorld )
		
		if(Input.is_action_just_pressed("left_mouse")):
			
			for g in relativeSurface.size():
				var curTile = relativeSurface[g]
				print(curTile)
				if GameState.grid[curTile.y][curTile.x] == true:
					is_placeable = false
					break
					
			if is_placeable == true:
				_placeBuilding()
				for g in relativeSurface.size():
					var curTile = relativeSurface[g]
					GameState.grid[curTile.y][curTile.x] = true
			
				
func _placeBuilding():
	var placed_building = building.instantiate()
	add_child(placed_building)
	placed_building.position = Vector3(camera.mouseWorld.x, 1, camera.mouseWorld.y)

