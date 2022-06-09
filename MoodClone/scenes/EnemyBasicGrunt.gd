extends KinematicBody

onready var nav = get_tree().get_nodes_in_group("NavMesh")[0]
onready var player = get_tree().get_nodes_in_group("Player")[0]

var path = []
var path_index = 0
var speed = 3
var health = 20

func _ready():
	pass

func take_damage(dmg_amount):
	health -= dmg_amount
	if health <= 0:
		death()
	
	
func _physics_process(delta):
	if path_index < path.size():
		var direction = (path[path_index] - global_transform)
		if direction.length() < 1:
			path_index += 1
		else:
			move_and_slide(direction.normalize() * speed, Vector3.UP)
	else:
		find_path(player.global_transform.origin)
	
	
func find_path(target):
	path = nav.get_simple_path(global_transform.origin)
	path_index = 0
	
func death():
	set_process(false)
	set_physics_process(false)
	$CollosionShape.disabled = true
	if health < -20:
		$AnimationSprite3D.play("explode")
	else:
		$AnimationSprite3D.play("die")
	
	
	
func shoot(target):
	pass
	
	
	
	
	
	
	
	
