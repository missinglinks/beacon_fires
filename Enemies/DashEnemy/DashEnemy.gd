extends KinematicBody2D

onready var anim : AnimationPlayer = $AnimationPlayer

export var move_speed: float = 50
export var attack_windup: float = 0.3
export var notice_radius: float = 200

var current_move_target: Vector2 = Vector2.ZERO

onready var target = get_parent().get_node("Player")

func _draw():

	if $States/Attack.target_position:
	 	draw_line(Vector2.ZERO,  $States/Attack.target_position - position, Color(255, 0, 0), 1)

func _ready():
	anim.play("BaseAnimation")
	
func _physics_process(delta):
	if current_move_target != Vector2.ZERO:
		move_and_collide((current_move_target - position).normalized() * move_speed * delta)
		
	if current_move_target.distance_to(position) < 20:
		current_move_target = Vector2.ZERO


func set_movement(target, speed):
	move_speed =  speed
	current_move_target = target

func move_body(delta, motion):
	move_and_collide(motion)
	
func _process(delta):
	update()
	if $States.state.name != $StateLabel.text:
		$StateLabel.text = $States.state.name
	

