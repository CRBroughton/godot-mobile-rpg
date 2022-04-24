extends Control

export (String, MULTILINE) var description = ''

func _on_HoverInfo_mouse_entered():
	print(description)


func _on_HoverInfo_mouse_exited():
	pass
