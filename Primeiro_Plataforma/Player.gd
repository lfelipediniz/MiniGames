extends KinematicBody2D

const UP = Vector2(0, -1) #apontando que a parte superior é negativa
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -500 #força do pulo

var motion = Vector2() #isso significa que ele recebe dois valores, x e y

func _physics_process(delta): # O delta é o fps
	
	motion.y += GRAVITY #gravidade
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED #velocidade que ele corre no eixo x apertando a seta da direita
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED #velocidade que ele corre no eixo x apertando a seta da esquerda
	else:
		motion.x = 0 #caso nenhuma esteja sendo pressionada, a velocidade é 0
	if Input.is_action_pressed("ui_left") && Input.is_action_pressed("ui_right"):
		motion.x = 0 #caso nenhuma esteja sendo pressionada, a velocidade é 0

	
	if is_on_floor(): #função que faz o calculo para saber se o personagem esta encostado no chão
		print("esta no chao")
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
			
	motion = move_and_slide(motion, UP) #esta função permite o personagem se movimentar, e igualar ao motion permite que toda vez que a função for rodada, ela zere novamente

	
