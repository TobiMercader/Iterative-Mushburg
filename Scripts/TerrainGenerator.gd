extends Node3D

var size = 16
var grid: Array

@onready var tilemap = $".."

func _ready():
		for y in size:
			var row = []
			for x in size:
				row.append(false)
			GameState.grid.append(row)
		
	
		for y in size:
			for x in size:
				var atlas: Vector2i
				if  x % 2 == 1 and y % 2 == 1 or x % 2 == 0 and y % 2 == 0:
					atlas = Vector2i(0, 0)
				else:
					atlas = Vector2i(1, 0)
				tilemap.set_cell(0, Vector2i(x, y), 0, atlas)
		
	
		
