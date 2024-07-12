extends Node

@onready var camera = $"../WorldCamera"

var building_positions: Array
var current_rect

@export var buildCol: Resource

var building = preload("res://scenes/node_wall.tscn")
var buildIdx = 0
var building_surface = [Vector2i.ZERO]

func _ready():
	print(buildCol.scnList[0])

func _input(event):
	if event.is_action_pressed("scroll_up"):
		buildIdx += 1
		building = buildCol.scnList[buildIdx]
	
	if event.is_action_pressed("left_mouse"):
		buildIdx -= 1
		building = buildCol.scnList[buildIdx]
		
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
	print("placed")
	var placed_building = building.instantiate()
	add_child(placed_building)
	placed_building.position = Vector3(camera.mouseWorld.x, 1, camera.mouseWorld.y)

