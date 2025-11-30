extends CharacterBody2D

@export var stats : Resource
var direction : Vector2
enum stats_machine {
	move,
	attack,
	stund,
	die
}

var current_state = stats_machine.move

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		current_state = stats_machine.attack

func _physics_process(delta: float) -> void:
	match current_state:
		stats_machine.move:
			mouvement()
		stats_machine.attack:
			_attack()
	move_and_slide()


func mouvement():
	direction = Input.get_vector("q","d","z","s")
	if direction.x != 0 or direction.y != 0:
		$AnimatedSprite2D.play("walk")
		if direction.x > 0:
			$AnimatedSprite2D.flip_h =false
		else:
			$AnimatedSprite2D.flip_h = true
	elif direction.x == 0 and direction.y == 0:
		$AnimatedSprite2D.play("idle")
	velocity = direction * stats.mouve_speed
	pass
func _attack():
	$AnimatedSprite2D.play("attack_")
	if $AnimatedSprite2D.frame == 2:
		current_state = stats_machine.move
	pass
