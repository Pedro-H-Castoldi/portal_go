extends Area2D

export(String, FILE, "*.tscn") var fases

func _on_Area2D_body_entered(body):
	get_tree().change_scene(fases)
