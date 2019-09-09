extends Control


func _process(delta):
	if not visible and GameState._retry_state and GameState.retries > 0 :
		visible = true
		
	if GameState._retry_state and visible:
		var x  = 300 * GameState.retry_timer.time_left
		$ColorRect/VSplitContainer/RetryTimerRect.set_size(Vector2(x, 15))