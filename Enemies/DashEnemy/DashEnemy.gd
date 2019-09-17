extends KinematicBody2D

onready var anim = $AnimationPlayer

export var move_speed: float = 20
export var attack_windup: float = 1
export var notice_radius: float = 400
export var dash_speed: float = 800

var target
var current_move_target: Vector2 = Vector2.ZERO
var dash_target

var bullet = preload("res://Enemies/Bullet/Bullet.tscn")

func _draw():
	if dash_target:
	 	draw_line(Vector2.ZERO,  dash_target - position, Color(255, 0, 0), 1)
	

func _ready():
	target = GameState.player
	anim.play("BaseAnimation")


func dash(delta):
	move_and_collide((dash_target - position).normalized() * dash_speed * delta)


func set_movement(target, speed):
	current_move_target = target


func move_body(delta):
	move_and_collide((current_move_target - position).normalized() * move_speed * delta)


func _process(delta):
	update()
	if $States.state.name != $StateLabel.text:
		$StateLabel.text = $States.state.name


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		GameState.level_failed()
