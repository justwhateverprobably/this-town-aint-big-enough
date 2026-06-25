extends Sprite2D

var chamber := [true, true, true, false, false, false]
var health := 3
var current_shot := 0
signal on_enemy_shoot_action

func shoot_or_spin():
	# IMPLEMENT ACTION DELAY SO ENEMY TURN ISN'T IMMEDIATE
	if randf() < 0.5:
		shoot()
		on_enemy_shoot_action.emit()
	else:
		spin()
	

func shoot():
	# call shoot function on parent node passing in relevant data to be modified
	$"..".shoot(chamber, current_shot, health)
	$"../../UILayer/Control/DebugLog".text = "enemy took shoot action"
	# increment shot (move to next chamber)
	current_shot += 1
	
func spin():
	$"..".spin(chamber)
	$"../../UILayer/Control/DebugLog".text = "enemy took spin action"
