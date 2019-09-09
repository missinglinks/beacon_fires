extends Control

onready var torchIndicator: ColorRect = $TorchIndicator
onready var torchRect: ColorRect = $TorchIndicator/ColorRect
onready var state = $State/StateLabel

var size: Vector2 = Vector2.ZERO

var active_time = 2

func _ready():
	torchIndicator.visible = false
	torchRect.set_size(size)
	
	$State/RetriesLabel.text = "Retries: " + String(GameState.retries)
	$State/BeaconsLevel.text = "Beacons: " + String(GameState.beacons_lit) 

func _on_Torch_time_changed(time_left):	
	var x = time_left/active_time * 100
	torchRect.set_size(Vector2(x, 15))


func _on_Torch_torch_picked_up(time):
	torchIndicator.visible = true
	active_time = time


func _on_Player_state_changed(new_state: State):
	state.text = "Player "+new_state.name
