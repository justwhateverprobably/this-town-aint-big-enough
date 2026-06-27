extends Node2D


func advance_chamber(chamber):
	# Number of chambers in the cylinder
	var n = chamber.size()
	# Save the first element (this will move to the end)
	var first = chamber[0]
	# # Shift everything left by one position
	for i in range(0, n - 1):
		chamber[i] = chamber[i + 1]
	# Move the original first element to the end
	chamber[n - 1] = first
	
	return chamber
	
func spin_chamber(chamber):
	# Decide how many positions to rotate (0 to max-1)
	var increment = randi_range(0, len(chamber) - 1)
  
	# Repeat single-step rotation "increment" times
	for i in range(increment):
		chamber = advance_chamber(chamber)
		
	return chamber
	
func update_health(health, increment):
	health += increment
	return health
