extends "res://ActionButton.gd"

const Slash = preload('res://Slash.tscn')

func _on_pressed():
	var main = get_tree().current_scene
	var enemy = main.find_node('Enemy')
	var playerStats = main.find_node('PlayerStats')
	if enemy != null and playerStats != null:
		create_slash(enemy.global_position)
		enemy.take_damage(4)
		playerStats.mp += 2
		playerStats.ap -= 1

func create_slash(position):
	var slash = Slash.instance() # creates a new instance of the slash animation
	var main = get_tree().current_scene # gets the main node for scene
	main.add_child(slash) # adds slash as a child to main
	slash.global_position = position # sets the position
