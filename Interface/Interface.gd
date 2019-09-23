extends Control

onready var torchUI: Control = $TorchUI
onready var torchRect: ColorRect = $TorchUI/TorchIndicator/ColorRect
onready var state: Label = $State/StateLabel

var size: Vector2 = Vector2.ZERO

var active_time: float = 2

func _ready() -> void:
	torchRect.set_size(size)
	$State/RetriesLabel.text = "Retries: " + String(GameState.retries)
	$State/BeaconsLevel.text = "Beacons: " + String(GameState.beacons_lit) 


func _on_Torch_time_changed(time_left) -> void:
	if GameState.state != GameState.states.Success:
		var x_percent = time_left/active_time 
		torchRect.set_size(Vector2(500 * x_percent, 20))


func _on_Torch_torch_picked_up(time: float) -> void:
	$TorchUI.visible = true
	active_time = time


func _on_Player_state_changed(new_state: State) -> void:
	state.text = "Player "+new_state.name