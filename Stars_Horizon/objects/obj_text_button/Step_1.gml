var _mouse_gui_x = device_mouse_x_to_gui(0),
	_mouse_gui_y = device_mouse_y_to_gui(0);

if collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id{
	text_color = c_yellow;
	if mouse_check_button_pressed(mb_left){
		image_xscale = box_scale_x - 0.1;
		image_yscale = box_scale_y - 0.1
		text_scale = 0.9;
	}
	if mouse_check_button_released(mb_left){
		image_xscale = box_scale_x;
		image_yscale = box_scale_y
		text_scale = 1;
		
		event_user(0);
	}
}else{
	text_color = c_white;
	image_xscale = box_scale_x;
	image_yscale = box_scale_y;
	text_scale = 1;
}