extends Node2D

func shoot(chamber: Array, current_shot: int, health_to_affect: int):
	# if the current round is true (occupied by bullet), then fire it (set false)
	if chamber[current_shot] == true:
		update_health(health_to_affect, -1)
		print("health updated")
		chamber[current_shot] = false
		print("chamber updated")
	# if empty, remains empty
	else:
		chamber[current_shot] = false

	
func spin(chamber: Array):
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
	
	return chamber
	
func update_health(health: int, increment: int):
	health += increment
	return health
