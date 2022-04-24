extends Node

const BattleUnits = preload('res://BattleUnits.tres')

var max_lvl: int = 10
var lvl = 1
var max_hp: int = 25
var hp = max_hp setget set_hp
var max_ap: int = 3
var ap = max_ap setget set_ap
var max_mp: int = 10
var mp = max_mp setget set_mp

signal hp_changed(value)
signal mp_changed(value)
signal ap_changed(value)
signal lvl_changed()
signal end_turn

func _ready():
	BattleUnits.PlayerStats = self # says 'Player is now accessible to the BattleUnits'

func _exit_tree():
	BattleUnits.PlayerStats = null # Player is removed from BattleUnits

func set_hp(value: int) -> void:
	hp = clamp(value, 0, max_hp) # ensures hp doesn't exceed max_hp, or below 0
	emit_signal("hp_changed", hp)
	
func set_ap(value: int) -> void:
	ap = clamp(value, 0, max_ap)
	emit_signal("ap_changed", ap)
	
	if ap == 0:
		emit_signal("end_turn")
	
func set_mp(value: int) -> void:
	mp = clamp(value, 0, max_mp)
	emit_signal("mp_changed", mp)

func advance_lvl() -> void:
	var currentLvl = lvl + 1
	lvl = clamp(currentLvl, 0, 10)
	emit_signal('lvl_changed', lvl)
