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
		var direction = (path[path_index] - global_transform.origin)
		if direction.length() < 1:
			path_index += 1
		else:
			move_and_slide(direction.normalized() * speed, Vector3.UP)
	else:
		find_path(player.global_transform.origin)
	
	
func find_path(target):
	path = nav.get_simple_path(global_transform.origin,target)
	path_index = 0
	
func death():
	set_process(false)
	set_physics_process(false)
	$CollisionShape.disabled = true
	if health < -20:
		$AnimationSprite3D.play("Explode")
	else:
		$AnimationSprite3D.play("Die")
	
	
	
func shoot(target):
	pass
	
	
	
	
	
	
	
	
