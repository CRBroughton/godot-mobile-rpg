extends Node2D

const BattleUnits = preload('res://BattleUnits.tres')

export(int) var hp = 25 setget set_hp
export(int) var damage = 4

onready var hpLabel = $HPLabel
onready var animationPlayer = $AnimationPlayer

signal died
signal end_turn

func _ready():
	BattleUnits.Enemy = self

func _exit_tree():
	BattleUnits.Enemy = null

func set_hp(new_hp):
	hp = new_hp
	if hpLabel != null:
		hpLabel.text = str(hp)+'hp'
	
func attack() -> void:
	yield(get_tree().create_timer(0.4), 'timeout') # gets base root node for current scene, waits for a set period of time
	animationPlayer.play("Attack")
	yield(animationPlayer, 'animation_finished')
	emit_signal("end_turn")
	
func deal_damage():
	BattleUnits.PlayerStats.hp -= damage

func take_damage(amount):
	self.hp -= amount
	if is_dead():
		emit_signal("died")
		queue_free() # destroys current node
	else:
		animationPlayer.play("Shake")
	
func is_dead():
	return hp <= 0
	
