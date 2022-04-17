extends Node

func _on_SwordButton_pressed():
	var enemy = find_node('Enemy')
	
	if enemy != null: 
		enemy.hp -= 4
