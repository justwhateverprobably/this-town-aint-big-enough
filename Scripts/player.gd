extends Sprite2D

var chamber := [true, true, true, false, false, false]
var health := 3
var current_round := 0


func _ready():
	# initialize chamber with random loadout order
	chamber.shuffle()
		
func shoot():
	# increment the current round by 1
	current_round += 1
	# if the current round is true (occupied by bullet), then fire it (set false)
	if chamber[current_round] == true:
		chamber[current_round] = false
	# if empty, remains empty
	else:
		chamber[current_round] = false
	
func spin():
	# Number of chambers in the cylinder
	var n = chamber.size()
	# Decide how many positions to rotate (0 to max-1)
	var increment = randi_range(0, len(chamber) - 1)
  
	# Repeat single-step rotation "increment" times
	for i in range(increment):
		# Save the first element (this will move to the end)
		var first = chamber[0]
		# # Shift everything left by one position
		for j in range(0, n - 1):
			chamber[j] = chamber[j + 1]
		# Move the original first element to the end
		chamber[n - 1] = first
	
func update_health(increment: int):
	health += increment
