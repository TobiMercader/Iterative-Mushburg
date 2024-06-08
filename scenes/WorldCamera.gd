extends Camera3D

@onready var world = $".."

var rayResult

var mouseWorld

func _process(delta):
#gets the mouse position relative to the screen
	var posMouse = get_viewport().get_mouse_position()
	#creates a ray that goes in the direction between the center of the camera and the point
	#of the mouse on hte camera frame
	var rayMouseFrom = self.project_ray_origin(posMouse)
	#cerates a point that goes from the previous point to a point in the direction of the ray 
	#but 100 points foward 
	var rayMouseTo =  rayMouseFrom + self.project_ray_normal(posMouse) * 100
	#creates a ray query, used to get info from the ray
	var rayQuery = PhysicsRayQueryParameters3D.create(rayMouseFrom, rayMouseTo, 1)
	#reference to the world space (coordinates etc..)
	var worldSpace = world.get_world_3d().direct_space_state
	#gets the point that intersected with a collider
	rayResult = worldSpace.intersect_ray(rayQuery)
	print(rayResult)
	
	if !rayResult.is_empty():
		mouseWorld = Vector3i(rayResult.position.x, rayResult.position.z, rayResult.position.y)
