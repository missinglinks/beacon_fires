extends Node2D

onready var bf_position = $BeaconFirePosition

func get_beacon_fire_position():
	return bf_position.position