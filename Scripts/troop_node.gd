extends CharacterBody3D

@onready var world = $".."
@onready var typesearcher = $TypeSearcher
@export var speed = 2

var available_buildings
var target
var ind = 0

func _ready():
	#_search_building()
	typesearcher._search_type(0)
	target = typesearcher.target
	
func _process(delta):
	velocity = position.direction_to(target.position - Vector3(1, 0, 1)) * speed
	
	if position.distance_to(target.position - Vector3(1, 0, 1))  <= 0.1:
		var attack = Attack.new()
		attack.attack_damage = 8
		self.position = position + attack.attack_knockback
		target.damage(attack)
		
	move_and_slide()

	
func _search_building():
	available_buildings = get_tree().get_nodes_in_group("buildings")
	target = available_buildings[0]
	

