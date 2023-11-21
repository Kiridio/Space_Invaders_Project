extends CanvasLayer

@onready var invader_1_tex = %Invader1Tex
@onready var invader_1_label = %Invader1Label
@onready var invader_2_tex = %Invader2Tex
@onready var invader_2_label = %Invader2Label
@onready var invader_3_tex = %Invader3Tex
@onready var invader_3_label = %Invader3Label

@onready var timer = $Timer

var control_array = []

func _ready():
	control_array.append_array([invader_1_tex, invader_1_label, invader_2_tex, invader_2_label, invader_3_tex, invader_3_label])

	for control in control_array:
		(control as Control).modulate = Color.TRANSPARENT

func load_game():
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")


func show_next_control():
	var control = control_array.pop_front() as Control
	if control != null:
		control.modulate = Color.WHITE
	else:
		timer.stop()
		timer.queue_free()
