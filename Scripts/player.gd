extends Sprite2D

var cylinder := [true, true, true, false, false, false]
var health := 3
@onready var healthbar = $"../../UILayer/Control/PlayerUI/PlayerHealth"
@onready var enemy = $"../Enemy"
@onready var entities = $".."
@onready var info = $"../../UILayer/Control/MarginContainer2/InfoText"
@onready var cylinder_graphic = $"../../PlayerGun"
@onready var bullet_list = $"../../Bullets"


func _ready():
	# initialize cylinder with random loadout order
	cylinder.shuffle()
	update_cylinder_graphic()
		
func shoot():
	if cylinder[0] == true:
		enemy.update_health(-1)
		cylinder[0] = false
		
	cylinder = entities.advance_cylinder(cylinder)
	update_cylinder_graphic()
	info.text = "You took shoot action"
		
func spin():
	cylinder = entities.spin_cylinder(cylinder)
	update_cylinder_graphic()
	info.text = "You took spin action"

func update_health(increment):
	health = entities.update_health(health, increment)
	healthbar.remove_child(healthbar.get_child(0))

func update_cylinder_graphic():
	for child in bullet_list.get_children():
		child.queue_free()
	for i in range(cylinder.size()):
		if cylinder[i] == true:
			var bullet = Sprite2D.new()
			bullet.texture = load("res://Graphics/bullet.png")
			# at index i+1 because we want to skip the cylinder itself
			var current_chamber = cylinder_graphic.get_child(i + 1)
			bullet.position = current_chamber.position
			bullet_list.add_child(bullet)
