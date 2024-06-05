extends Node3D

@onready var world = $".."
@onready var typeSearcher = $TypeSearcher
@export var speed = 2

var ind = 0

func _ready():
	typeSearcher._search_type(0)

