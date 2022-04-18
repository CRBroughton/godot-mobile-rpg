extends Node2D

var hp = 25 setget set_hp

onready var hpLabel = $HPLabel
onready var animationPlayer = $AnimationPlayer

signal died
signal end_turn

func set_hp(new_hp):
	hp = new_hp
	hpLabel.text = str(hp)+'hp'
	
func attack(target) -> void:
	yield(get_tree().create_timer(0.4), 'timeout') # gets base root node for current scene, waits for a set period of time
	animationPlayer.play("Attack")
	yield(animationPlayer, 'animation_finished')
	target.hp -= 3
	emit_signal("end_turn")
	
func deal_damage():
	print('deal dmg')

func take_damage(amount):
	self.hp -= amount
	if is_dead():
		emit_signal("died")
		queue_free() # destroys current node
	else:
		animationPlayer.play("Shake")
	
func is_dead():
	return hp <= 0
