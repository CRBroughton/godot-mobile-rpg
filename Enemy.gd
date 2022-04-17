extends Node2D

var hp = 25 setget set_hp

onready var hpLabel = $HPLabel
onready var animationPlayer = $AnimationPlayer

signal died

func set_hp(new_hp):
	hp = new_hp
	hpLabel.text = str(hp)+'hp'
	
	if hp <= 0:
		emit_signal("died")
		queue_free() # destroys current node
	animationPlayer.play('Shake')
	yield(animationPlayer, 'animation_finished') # next line won't run until animation has finished
	animationPlayer.play("Attack")
