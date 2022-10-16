extends CanvasLayer

onready var armor = $MarginContainer/Stats/Values/ArmorValue
onready var health = $MarginContainer/Stats/Values/HealthValue
onready var ammo = $MarginContainer/Stats/Ammo/AmmoValue

func _process(delta):
	var current_gun = PlayerStats.current_gun
	armor.text = PlayerStats.get_armor()
	health.text = PlayerStats.get_health()
	
	if current_gun == "pistol":
		ammo.text = PlayerStats.get_pistol_ammo
	if current_gun == "Shotgun":
		ammo.text = PlayerStats.get_shotg_ammo
	if current_gun == "Uzi":
		ammo.text = PlayerStats.get_pistol_ammo
	if current_gun == "RocketLauncher":
		ammo.text = PlayerStats.get_rocket_ammo
