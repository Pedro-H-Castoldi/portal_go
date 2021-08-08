extends StaticBody2D

var FLIP = true
var POISICAO_INICIAL
var POSICAO_FINAL
var VELOCIDADE = 0.3
func _ready():
	$Sprite.play("Walk")
	POISICAO_INICIAL = $".".position.x
	POSICAO_FINAL = $".".position.x + 100
	
func _process(delta):
	if POISICAO_INICIAL <= POSICAO_FINAL and FLIP:
		$".".position.x += VELOCIDADE
		$Sprite.flip_h = false
		if $".".position.x >= POSICAO_FINAL:
			FLIP = false
	
	if $".".position.x >= POISICAO_INICIAL and !FLIP:
		$".".position.x -= VELOCIDADE
		$Sprite.flip_h = true
		if $".".position.x <= POISICAO_INICIAL:
			FLIP = true
