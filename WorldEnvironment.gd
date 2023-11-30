extends WorldEnvironment

const ROTATION_SPEED = PI / 100

func _ready():
	environment.sky_rotation.y = 0

func _process(delta):
	environment.sky_rotation.y += ROTATION_SPEED * delta
