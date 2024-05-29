extends Node3D
var max_health: int = 120
var health: int

func damage(attack: Attack):
	health -= attack.attack_damage
	if health <= 0:
		print("me mori")
	
func _ready():
	health = max_health
	
