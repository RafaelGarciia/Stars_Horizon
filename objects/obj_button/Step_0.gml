hovering = position_meeting( device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id );


if hovering {
	image_xscale = scale_x + .1;
	image_yscale = scale_y + .1;
	if mouse_check_button_pressed(mb_left) {
		image_index = 1;
	} else if mouse_check_button_released(mb_left) {
		image_index = 0;
		event_user(0);
		alarm[0] = 10;
	}
} else {
	image_xscale = scale_x;
	image_yscale = scale_y;
	image_index  = 0;
}


switch image_index {
	case 0: text_y = y  ;	break;
	case 1: text_y = y+3;	break;
	case 2: text_y = y+4;	break;
	case 3: text_y = y+5;	break;
}
