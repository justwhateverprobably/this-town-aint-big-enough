extends Node2D

var is_player_turn := true


func _process(delta: float) -> void:
	if not is_player_turn:
		$Enemy.shoot_or_spin()
		# play corresponding anim
		# update player health if shot action taken
		# update debug message ui
		pass


func _on_fire_button_pressed() -> void:
	if is_player_turn:
		$Player.shoot()
		# trigger shoot anim
		# handle enemy health
		# update debug message ui
		is_player_turn = false


func _on_spin_button_pressed() -> void:
	if is_player_turn:
		$Player.spin()
		# trigger spin anim
		is_player_turn = false
