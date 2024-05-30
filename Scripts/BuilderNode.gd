extends Node

@onready var world = $".."
@onready var camera = $"../Camera3D"

var mouseWorld

var building_positions: Array
var current_rect

var building = preload("res://scenes/node_wall.tscn")

func _input(InputEvent):
	if Input.is_key_pressed(KEY_1):
		building = preload("res://scenes/test_building.tscn")
		GameState.building_surface = [Vector3i(0, 0, 0), Vector3i(-1, 0, 0), Vector3i(0, -1, 0), Vector3i(-1, -1, 0)]
	elif Input.is_key_pressed(KEY_2):
		building = preload("res://scenes/node_wall.tscn")
		GameState.building_surface = [Vector3i(0, 0, 0)]
	elif Input.is_key_pressed(KEY_3):
		building = preload("res://scenes/troop_node.tscn")
		GameState.building_surface = [Vector3i(0, 0, 0)]
	
	

func _process(delta):
	#gets the mouse position relative to the screen
	var posMouse = get_viewport().get_mouse_position()
	#creates a ray that goes in the direction between the center of the camera and the point
	#of the mouse on hte camera frame
	var rayMouseFrom = camera.project_ray_origin(posMouse)
	#cerates a point that goes from the previous point to a point in the direction of the ray 
	#but 100 points foward 
	var rayMouseTo =  rayMouseFrom + camera.project_ray_normal(posMouse) * 100
	#creates a ray query, used to get info from the ray
	var rayQuery = PhysicsRayQueryParameters3D.create(rayMouseFrom, rayMouseTo, 1)
	#reference to the world space (coordinates etc..)
	var worldSpace = world.get_world_3d().direct_space_state
	#gets the point that intersected with a collider
	var rayResult = worldSpace.intersect_ray(rayQuery)
	

	
	
	
	if !rayResult.is_empty():
		var is_placeable = true
		#converts the float axis into hole numbers
		mouseWorld = Vector3i(rayResult.position.x, rayResult.position.z, rayResult.position.y)
		var relativeSurface = GameState.building_surface.map(func(absolute): return absolute + mouseWorld )
		if(Input.is_action_just_pressed("left_mouse")):
			for g in relativeSurface.size():
				var curTile = relativeSurface[g]
				print(curTile)
				if GameState.grid[curTile.z][curTile.y][curTile.x] == true:
					is_placeable = false
					break
			if is_placeable == true:
				_placeBuilding()
			
				
func _placeBuilding():
	var placed_building = building.instantiate()
	add_child(placed_building)
	placed_building.position = Vector3(mouseWorld.x, mouseWorld.z, mouseWorld.y)
	if placed_building.is_in_group("buildings"):
		building_positions.append(current_rect)
		emit_signal("building_placed")
		print("yes i am")
		
signal building_placed()
	
