extends Node2D


func advance_cylinder(cylinder):
	# Number of cylinders in the cylinder
	var n = cylinder.size()
	# Save the first element (this will move to the end)
	var last = cylinder[n-1]
	# # Shift everything left by one position
	for i in range(n-1, 0, -1):
		cylinder[i] = cylinder[i - 1]
	# Move the original first element to the end
	cylinder[0] = last
	
	return cylinder
	
func spin_cylinder(cylinder):
	# Decide how many positions to rotate (0 to max-1)
	var increment = randi_range(0, len(cylinder) - 1)
  
	# Repeat single-step rotation "increment" times
	for i in range(increment):
		cylinder = advance_cylinder(cylinder)
		
	return cylinder
	
func update_health(health, increment):
	health += increment
	return health
