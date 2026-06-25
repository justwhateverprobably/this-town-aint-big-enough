extends Sprite2D

var chamber := [true, true, true, false, false, false]
var health := 3
var current_shot := 0



func _ready():
	# initialize chamber with random loadout order
	chamber.shuffle()
		
func shoot():
	# call shoot function on parent node passing in relevant data to be modified
	$"..".shoot(chamber, current_shot, health)
	$"../../UILayer/Control/DebugLog".text = "player took shoot action"
	# increment shot (move to next chamber)
	current_shot += 1
	
func spin():
	$"..".spin(chamber)
	$"../../UILayer/Control/DebugLog".text = "player took spin action"
