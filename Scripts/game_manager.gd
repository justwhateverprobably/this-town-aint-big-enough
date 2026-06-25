'''
to commit changes to github open terminal and type:

git add .
git commit -m "leave a message"
git push -u origin main
'''


extends Node2D

var is_player_turn := true
@onready var player = $Entities/Player
@onready var enemy = $Entities/Enemy
@onready var log = $UILayer/Control/DebugLog



func _process(_delta: float) -> void:	
	if neither_dead() and not is_player_turn:
			enemy.shoot_or_spin()
			# play corresponding anim
			# update debug message ui
			is_player_turn = true
	elif enemy.health == 0:
		# load win screen
		log.text = "you won"
		pass
	elif enemy.health == 0:
		# load lose screen
		log.text = "you lost"
		pass

func neither_dead() -> bool:
	var neither_dead: bool = player.health > 0 and enemy.health > 0
	return neither_dead
	

func _on_fire_button_pressed() -> void:
	if is_player_turn and neither_dead():
		player.shoot()
		# trigger shoot anim
		is_player_turn = false


func _on_spin_button_pressed() -> void:
	if is_player_turn and neither_dead():
		player.spin()
		# trigger spin anim
		is_player_turn = false
