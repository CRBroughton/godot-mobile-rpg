extends Node

onready var enemy = $Enemy
onready var playerStats = $PlayerStats
onready var battleActionButtons = $UI/BattleActionButtons

func _ready():
	start_player_turn()

func start_enemy_turn():
	battleActionButtons.hide()
	if enemy != null:
		enemy.attack(playerStats)
		yield(enemy, 'end_turn')
	start_player_turn()
		
func start_player_turn():
	battleActionButtons.show()
	playerStats.ap = playerStats.max_ap
	yield(playerStats, 'end_turn')
	start_enemy_turn()

func _on_SwordButton_pressed():
	if enemy != null: 
		enemy.take_damage(4)
		playerStats.ap -= 1


func _on_Enemy_died():
	battleActionButtons.hide()
	enemy = null
