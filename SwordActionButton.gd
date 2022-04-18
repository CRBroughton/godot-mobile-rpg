extends "res://ActionButton.gd"

func _on_pressed():
	var main = get_tree().current_scene
	var enemy = main.find_node('Enemy')
	var playerStats = main.find_node('PlayerStats')
	if enemy != null and playerStats != null:
		enemy.take_damage(4)
		playerStats.mp += 2
		playerStats.ap -= 1
