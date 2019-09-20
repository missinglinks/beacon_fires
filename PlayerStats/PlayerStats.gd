extends Node

var base_move_speed: float = 250
var move_speed: float

var base_hp: int = 0
var hp: int

var base_retries: int = 3
var retries: int

var base_torch_time: float = 10
var torch_time: float

var immunities = []


func reset():
	move_speed = base_move_speed
	hp = base_hp
	retries = base_retries
	torch_time = base_torch_time
	immunities = []
