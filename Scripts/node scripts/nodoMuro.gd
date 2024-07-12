extends StaticBody3D

var adjacent = {"xr": false, "xl": false, "yd": false, "yu": false}

var max_health: int = 50

var health: int

var indice_loc


func _ready():
	health = max_health
	
func damage(attack: Attack):
	health -= attack.attack_damage
	
	if health <= 0:
		#indice_loc += 1
		print("me mori")
