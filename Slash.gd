extends Node2D

func _on_AnimationPlayer_animation_finished():
	queue_free() # hides the animation on finish
