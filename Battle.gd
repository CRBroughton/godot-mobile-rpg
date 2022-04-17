extends Node

onready var hpLabel = $Enemy/HPLabel

func _on_SwordButton_pressed():
	hpLabel.text = '15hp'
