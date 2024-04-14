extends Node

@onready var world = $".."
@onready var camera = $"../Camera3D"

var mouseWorld

var building = preload("res://scenes/test_building.tscn")

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
	var rayQuery = PhysicsRayQueryParameters3D.create(rayMouseFrom, rayMouseTo)
	#reference to the world space (coordinates etc..)
	var worldSpace = world.get_world_3d().direct_space_state
	#gets the point that intersected with a collider
	var rayResult = worldSpace.intersect_ray(rayQuery)
	
	
	if !rayResult.is_empty():
		#converts the float axis into hole numbers
		mouseWorld = rayResult.position
		if(Input.is_action_just_pressed("left_mouse")):
			var placed_building = building.instantiate()
			add_child(placed_building)
			placed_building.position = Vector3i(mouseWorld)
			print(Vector3i(mouseWorld))
	
