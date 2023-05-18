window_set_size(view_port_width, view_port_height);
surface_resize(application_surface, view_port_width, view_port_height);
display_set_gui_size(hud_width, hud_height);


if keyboard_check(vk_up){
	view_port_width  = 1600
	view_port_height = 900
	window_center();
}
if keyboard_check(vk_down){
	view_port_width  = 960;
	view_port_height = 540;
	window_center();
}