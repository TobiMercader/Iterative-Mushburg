extends Node

@onready var world = $".."
@onready var camera = $"../Camera3D"

var mouseWorld

var building = preload("res://scenes/test_building.tscn")

func _process(delta):
	var posMouse = get_viewport().get_mouse_position()
	var rayMouseFrom = camera.project_ray_origin(posMouse)
	var rayMouseTo =  rayMouseFrom + camera.project_ray_normal(posMouse) * 100
	var rayQuery = PhysicsRayQueryParameters3D.create(rayMouseFrom, rayMouseTo)
	var worldSpace = world.get_world_3d().direct_space_state
	#gets the point that intersected with a collider
	var rayResult = worldSpace.intersect_ray(rayQuery)
	if !rayResult.is_empty():
		#converts the float axis into hole numbers
		mouseWorld = Vector3i(rayResult.position.x, rayResult.position.y, rayResult.position.z)
	
func _input(event):
	if event.is_action_pressed("left_mouse"):
		var placed_building = building.instantiate()
		add_child(placed_building)
		placed_building.position = mouseWorld
