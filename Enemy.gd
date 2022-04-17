extends Node2D

var hp = 25 setget set_hp

onready var hpLabel = $HPLabel
onready var animationPlayer = $AnimationPlayer

func set_hp(new_hp):
	hp = new_hp
	hpLabel.text = str(hp)+'hp'
	
	if hp <= 0:
		queue_free() # destroys current node
	animationPlayer.play('Shake')
