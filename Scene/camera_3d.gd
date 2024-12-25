extends Camera3D

# Скорость движения камеры
var speed = 1.0

func _process(delta):
	# Получаем ввод с клавиатуры
	var direction = Vector3.ZERO
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_up"):
		direction.z -= 1
	if Input.is_action_pressed("ui_down"):
		direction.z += 1
	if Input.is_action_pressed("ui_forward"):
		direction.y -= 1
	if Input.is_action_pressed("ui_backward"):
		direction.y += 1

	# Нормализуем направление
	if direction.length() > 0:
		direction = direction.normalized()

	# Двигаем камеру
	translate(direction * speed * delta)
