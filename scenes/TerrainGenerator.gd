extends Node3D

var size = 16
var grid: Array

@onready var gridmap = $".."

func _ready():
	for z in size:
		var layer = []
		for y in size:
			var row = []
			layer.append(row)
			for x in size:
				row.append(false)
		GameState.grid.append(layer)
		
	
	for z in 5:
		for y in size/(z+1):
			for x in size/(z+1):
				GameState.grid[z][y][x] = true
				var atlas
				if  x % 2 == 1 and y % 2 == 1 or z % 2 == 0 and x % 2 == 0 and y % 2 == 0:
					atlas = 0
				else:
					atlas = 1
				gridmap.set_cell_item(Vector3i(x, z, y), atlas)
		
	
		
