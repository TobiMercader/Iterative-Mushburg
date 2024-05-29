extends Node3D

var size = 16
var grid: Array

@onready var gridmap = $".."

func _ready():
	for z in 3:
		var layer = []
		for x in size/(z+1):
			var row = []
			layer.append(row)
			for y in size/(z+1):
				row.append(Vector3i(x,z, y))
				var atlas
				if  x % 2 == 1 and y % 2 == 1 or z % 2 == 0 and x % 2 == 0 and y % 2 == 0:
					atlas = 0
				else:
					atlas = 1
				gridmap.set_cell_item(Vector3i(x, z, y), atlas)
		GameState.grid.append(layer)
		
	
		
