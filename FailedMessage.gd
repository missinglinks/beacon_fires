extends Control


func _process(delta):
	if GameState.state == GameState.states.Retry:
		if not visible and GameState.retries > 0 :
			visible = true
		
		if visible:
			var x  = 300 * GameState.states.Retry.get_node("RetryTimer").time_left
			$ColorRect/VSplitContainer/RetryTimerRect.set_size(Vector2(x, 15))