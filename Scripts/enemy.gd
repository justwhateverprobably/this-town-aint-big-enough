extends Sprite2D

var chamber := [true, true, true, false, false, false]
var health := 3
var current_round := 0

func shoot_or_spin():
	# decide whether to shoot or spin
	# only call the function after x seconds
	pass

'''
could inherit rest of functionality from player class
maybe put player and enemy into a characters folder
and have player and enemy inherit from that class?
'''
