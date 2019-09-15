extends Control

onready var player_camera = get_node("../../Player/PlayerCamera")

var active = false

func _process(delta):
	if GameState.level_succeeded_state and active == false:
		active = true
		_activate()

func _on_Exit_pressed():
	get_tree().quit()


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
	$Buttons/Next.grab_focus()