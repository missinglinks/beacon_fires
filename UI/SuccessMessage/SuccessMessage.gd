extends Control

var player_camera 
var active = false

func _ready():
	var player = GameState.player
	if player:
		player_camera = player.get_node("PlayerCamera")

func _process(delta):
	if GameState.state == GameState.states.Success and active == false:
		active = true
		_activate()


func _on_Next_pressed():
	GameState.next_beacon()


func _activate():
	#visible = true
	yield(get_tree().create_timer(0.2), "timeout")
	player_camera.trigger_shake()
	$BeaconLitMessage.visible=true
	
	yield(get_tree().create_timer(0.2), "timeout")
	player_camera.trigger_shake()
	$BeaconLitMessage/Beacon.visible=true
	yield(get_tree().create_timer(0.2), "timeout")
	player_camera.trigger_shake()
	$BeaconLitMessage/BeaconNumber.text = String(GameState.beacons_lit)
	$BeaconLitMessage/BeaconNumber.visible=true
	yield(get_tree().create_timer(0.2), "timeout")
	player_camera.trigger_shake()
	$BeaconLitMessage/Lit.visible=true

	yield(get_tree().create_timer(0.2), "timeout")
	$Buttons.visible=true
	
	var next_button: Button = $Buttons/Next
	var fate_button: Button = $Buttons/Fate
	if GameState.shrines_activated == GameState.next_upgrade:
		next_button.queue_free()
		fate_button.grab_focus()
	else:
		fate_button.queue_free()
		next_button.grab_focus()

func _on_Fate_pressed():
	get_tree().change_scene("res://UI/UpgradeMenu/UpgradeSelection.tscn")
