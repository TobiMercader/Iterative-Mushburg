extends Node3D

@onready var world = $".."
@onready var typeSearcher = $TypeSearcher
@export var speed = 2

var ind = 0

func _ready():
	#_search_building()
	typeSearcher._search_type(0)
	
func _process(delta):
	
	if position.distance_to(typeSearcher.target.position - Vector3(1, 0, 1))  <= 0.1:
		var attack = Attack.new()
		attack.attack_damage = 8
		self.position = position + attack.attack_knockback
		typeSearcher.target.damage(attack)
		
