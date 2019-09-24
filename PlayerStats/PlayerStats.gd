extends Node

var base_move_speed: float = 250
var move_speed: float

var base_hp: int = 0
var hp: int

var base_retries: int = 3
var retries: int

var base_torch_time: float = 13
var torch_time: float

var base_cat_spawning_prob: float = 0.3
var cat_spawning_prob: float

var immunities = []

func _ready() -> void:
	reset()

func reset() -> void:
	move_speed = base_move_speed
	hp = base_hp
	retries = base_retries
	torch_time = base_torch_time
	cat_spawning_prob = base_cat_spawning_prob
	immunities = []
