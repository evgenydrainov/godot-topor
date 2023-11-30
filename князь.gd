extends Node

@onready var button  = $/root/Node3D/Button
@onready var button2 = $/root/Node3D/Button2
@onready var button3 = $/root/Node3D/Button3
@onready var label   = $/root/Node3D/Label

var guesses_left      = 10
var correct_topor     = 0
var correct_guesses   = 0
var incorrect_guesses = 0

func _ready():
	button .pressed.connect(button_pressed)
	button2.pressed.connect(button2_pressed)
	button3.pressed.connect(button3_pressed)
	
	update_ui(-1)
	decide_on_correct_topor()

func _process(delta):
	if guesses_left == 0:
		if Input.is_action_just_pressed("Restart"):
			get_tree().reload_current_scene()

func decide_on_correct_topor():
	correct_topor = randi_range(1, 3)

func guess_topor(topor):
	if guesses_left == 0:
		return
	
	if topor == correct_topor:
		correct_guesses += 1
	else:
		incorrect_guesses += 1
	
	guesses_left -= 1
	
	update_ui(int(topor == correct_topor))
	decide_on_correct_topor()

func update_ui(mode):
	match mode:
		-1:
			label.text = "\n"
		0:
			label.text = "INCORRECT TOPOR\n"
		1:
			label.text = "CORRECT TOPOR\n"
	
	label.text += "GUESSES LEFT: " + str(guesses_left) + "\n"
	
	if guesses_left == 0:
		label.text += ("GAME OVER\n"
			+ "PRESS 'R' TO RESTART\n"
			+ "CORRECT GUESSES: " + str(correct_guesses) + "\n"
			+ "INCORRECT GUESSES: " + str(incorrect_guesses) + "\n")

func button_pressed():
	guess_topor(1)

func button2_pressed():
	guess_topor(2)

func button3_pressed():
	guess_topor(3)
