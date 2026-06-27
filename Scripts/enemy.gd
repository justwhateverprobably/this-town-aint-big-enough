extends Sprite2D

var cylinder := [true, true, true, false, false, false]
var health := 3
@onready var healthbar = $"../../UILayer/Control/EnemyUI/EnemyHealth"
@onready var player = $"../Player"
@onready var entities = $".."
@onready var info = $"../../UILayer/Control/MarginContainer2/InfoText"

func shoot_or_spin():
	# IMPLEMENT ACTION DELAY SO ENEMY TURN ISN'T IMMEDIATE
	if randf() < 0.5:
		shoot()
	else:
		spin()
	

func shoot():
	if cylinder[0] == true:
		player.update_health(-1)
		cylinder[0] = false
		
	cylinder = entities.advance_cylinder(cylinder)
	info.text = "Opponent took shoot action"
	
func spin():
	cylinder = entities.spin_cylinder(cylinder)
	info.text = "Opponent took spin action"

func update_health(increment):
	health = entities.update_health(health, increment)
	healthbar.remove_child(healthbar.get_child(0))
