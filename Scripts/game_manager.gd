'''
to commit changes to github open terminal and type:

git add .
git commit -m "leave a message"
git push -u origin main
'''


extends Node2D

@onready var player = $Entities/Player
@onready var enemy = $Entities/Enemy
@onready var info = $UILayer/Control/InfoText
@onready var delay_timer = $EnemyActionTimer

enum GameState {
	PLAYER_TURN,
	ENEMY_TURN,
	GAME_OVER
}

var current_state = GameState.PLAYER_TURN

func _ready():
	info.text = "Your turn"
	
#-------------------
# HANDLE ENEMY TURN
#-------------------
func enemy_turn():
	if current_state == GameState.ENEMY_TURN:
		info.text = "Opponents turn"
		delay_timer.start()
		await delay_timer.timeout
		enemy.shoot_or_spin()
		# play corresponding anim here
		delay_timer.start()
		await delay_timer.timeout
		info.text = "Your turn"
	update_state()
		

#-------------------
# HANDLE PLAYER TURN
#-------------------
func _on_fire_button_pressed() -> void:
	if current_state == GameState.PLAYER_TURN:
		player.shoot()
		# trigger shoot anim
	update_state()

func _on_spin_button_pressed() -> void:
	if current_state == GameState.PLAYER_TURN:
		player.spin()
		# trigger spin anim
	update_state()


#-------------------
# HELPER FUNCTIONS
#-------------------	
func update_state():
	if enemy.health <= 0:
		info.text = "You Won!\nPress 'r' to continue or 'esc' to return to main menu."
		current_state = GameState.GAME_OVER
	elif player.health <= 0:
		info.text = "You Lost.\nPress 'r' to restart or 'esc' to return to main menu."
		current_state = GameState.GAME_OVER
	elif current_state == GameState.PLAYER_TURN:
		current_state = GameState.ENEMY_TURN
		enemy_turn()
	elif current_state == GameState.ENEMY_TURN:
		current_state = GameState.PLAYER_TURN


func _input(event: InputEvent) -> void:
	if current_state == GameState.GAME_OVER:
		if event.is_action_pressed("MainMenu"):
			get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")		
		elif event.is_action_pressed("NewRound"):
			get_tree().change_scene_to_file("res://Scenes/game.tscn")
