hovering = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);


if hovering{
	image_xscale = _xscale + .1;
	image_yscale = _yscale + .1;
	if mouse_check_button_pressed(mb_left){ image_index = 2	}
	else if mouse_check_button_released(mb_left){
		show_debug_message("Click");
		image_index = 0;
	}
}else{
	image_xscale = _xscale;
	image_yscale = _yscale;
	image_index  = 0;
}


if image_index == 0{
	_text_y = y;
}else{
	_text_y = y+5;
}