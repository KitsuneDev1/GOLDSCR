extends Popup

#VIDEO
@onready var Display_options = get_node("$TabContainer/Video/MarginContainer/Video/OptionButton")
@onready var Vsync = get_node("$TabContainer/Video/MarginContainer/Video/CheckButton")
@onready var Pixalate = get_node("$TabContainer/Video/MarginContainer/Video/HSlider")
@onready var bright = get_node("$TabContainer/Video/MarginContainer/Video/HSlider5")
@onready var contrast = get_node("$TabContainer/Video/MarginContainer/Video/HSlider6")
@onready var saturation = get_node("$TabContainer/Video/MarginContainer/Video/HSlider7")

#AUDIO
@onready var masterSlider = get_node("$TabContainer/Audio/MarginContainer/GridContainer/HSlider")
@onready var musicSlider = get_node("$TabContainer/Audio/MarginContainer/GridContainer/HSlider2")
@onready var SFXSlider = get_node("$TabContainer/Audio/MarginContainer/GridContainer/HSlider3")

func _on_option_button_item_selected(index):
	GlobalSettings.change_display_mode(index)
	pass # Replace with function body.

func _on_check_button_toggled(button_pressed):
	GlobalSettings.change_Vsycn(button_pressed)
	pass # Replace with function body.

func _on_h_slider_value_changed(value : float) -> void:
	GlobalSettings.update_master(0, linear_to_db(value))
	pass # Replace with function body.

func _on_h_slider_2_value_changed(value):
	GlobalSettings.update_master(1, linear_to_db(value))
	pass # Replace with function body.

func _on_h_slider_3_value_changed(value):
	GlobalSettings.update_master(2, linear_to_db(value))
	pass # Replace with function body.

func _on_h_slider_4_value_changed(value):
	GlobalSettings.pixelAmmount = value
