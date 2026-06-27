extends Sprite2D

var chamber := [true, true, true, false, false, false]
var health := 3
@onready var healthbar = $"../../UILayer/Control/PlayerUI/PlayerHealth"
@onready var enemy = $"../Enemy"
@onready var entities = $".."
@onready var info = $"../../UILayer/Control/InfoText"



func _ready():
	# initialize chamber with random loadout order
	chamber.shuffle()
		
func shoot():
	if chamber[0] == true:
		enemy.update_health(-1)
		chamber[0] = false
	else:
		chamber[0] = false
		
	chamber = entities.advance_chamber(chamber)
	info.text = "player took shoot action"
		
	
func spin():
	chamber = entities.spin_chamber(chamber)
	info.text = "player took spin action"

func update_health(increment):
	health = entities.update_health(health, increment)
	healthbar.remove_child(healthbar.get_child(0))
