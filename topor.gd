extends Node3D

const ROTATION_SPEED = 50

func _process(delta):
	rotation_degrees.y += ROTATION_SPEED * delta
