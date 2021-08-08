extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVIDADE = 20
const VELOCIDADE = 200
const ALTURA_PULO = -500
var vida = 3

var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVIDADE
	if vida == 3:
		$Status/Vida1.show()
		$Status/Vida2.show()
		$Status/Vida3.show()
	elif vida == 2:
		$Status/Vida1.show()
		$Status/Vida2.show()
	elif vida == 1:
		$Status/Vida1.show()
	
	if vida == 2:
		$Status/Vida3.hide()
	elif vida == 1:
		$Status/Vida2.hide()
	elif vida == 0:
		$Status/Vida1.hide()
	
	
	
	if Input.is_action_pressed("ui_right"):
		motion.x = VELOCIDADE
		$Sprite.play("Run")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = -VELOCIDADE
		$Sprite.play("Run")
		$Sprite.flip_h = true
	else:
		motion.x = 0
		$Sprite.play("Idle")
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = ALTURA_PULO
	else:
		$Sprite.play("Jump")
			
	motion = move_and_slide(motion, UP)


func _on_Dano_body_entered(body):
	vida -= 1
	
	if vida == 0:
		get_tree().change_scene("res://Menu.tscn")


func _on_Morte_body_entered(body):
	get_tree().change_scene("res://Menu.tscn")
