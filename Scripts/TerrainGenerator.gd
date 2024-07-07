extends Node3D

var size = 16
var grid: Array

@onready var gridmap = $".."

func _ready():
		for y in size:
			var row = []
			for x in size:
				row.append(false)
			GameState.grid.append(row)
		
	
		for y in size:
			for x in size:
				var atlas
				if  x % 2 == 1 and y % 2 == 1 or x % 2 == 0 and y % 2 == 0:
					atlas = 0
				else:
					atlas = 1
				gridmap.set_cell_item(Vector3i(x, 0, y), atlas)
		
	
		
