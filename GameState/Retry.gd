extends State

func enter(host):
	$RetryTimer.start()

func update(delta, host):
	if Input.is_action_pressed("interact") and GameState.retries > 0:
		GameState.retries -= 1
		$RetryTimer.stop()
		GameState.reset_level()
		return GameState.states.Action

func _on_RetryTimer_timeout():
	GameState.game_over()