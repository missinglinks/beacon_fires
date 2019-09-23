extends KinematicBody2D

onready var anim: AnimationPlayer = $AnimationPlayer
var bullet = preload("res://Enemies/Bullet/Bullet.tscn")

export var move_speed: float = 20
export var attack_windup: float = 0.8
export var notice_radius: float = 400
export var dash_speed: float = 1000
export var debug: bool = true

var target
var current_move_target: Vector2 = Vector2.ZERO
var dash_target: Vector2


func _draw() -> void:
	if dash_target and debug:
	 	draw_line(Vector2.ZERO,  dash_target - position, Color(255, 0, 0), 1)
	

func _ready() -> void:
	target = GameState.player
	anim.play("BaseAnimation")
	
	if !debug:
		$StateLabel.visible = false


func dash(delta: float) -> void:
	move_and_collide((dash_target - position).normalized() * dash_speed * delta)


func set_movement(target: Vector2, speed: float) -> void:
	current_move_target = target


func move_body(delta:float) -> void:
	move_and_collide((current_move_target - position).normalized() * move_speed * delta)


func _process(delta: float) -> void:
	update()
	if $States.state.name != $StateLabel.text:
		$StateLabel.text = $States.state.name


func _on_Area2D_body_entered(body) -> void:
	if body.name == "Player":
		GameState.level_failed()
