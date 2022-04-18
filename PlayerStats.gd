extends Node

var max_hp: int = 25
var hp = max_hp setget set_hp
var max_ap: int = 3
var ap = max_ap setget set_ap
var max_mp: int = 10
var mp = max_mp setget set_mp

signal end_turn

func set_hp(value: int) -> void:
	hp = value
	
func set_ap(value: int) -> void:
	ap = value
	
func set_mp(value: int) -> void:
	mp = value
