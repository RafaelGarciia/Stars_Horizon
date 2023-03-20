event_inherited();

var _mouse_gui_x = device_mouse_x_to_gui(0),
	_mouse_gui_y = device_mouse_y_to_gui(0);
	
if collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id{
	text_color = c_yellow;
	if mouse_check_button_pressed(mb_left){
		scale_text = 0.9;
	}
	
	if mouse_check_button_released(mb_left){
		scale_text = 1
	}
}else{
	text_color = c_black;
	scale_text = 1;
}