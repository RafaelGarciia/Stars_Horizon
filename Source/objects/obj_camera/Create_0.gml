display_width  = display_get_width ();
display_height = display_get_height();
view_port_width  = 960;	// 960 ; 1600
view_port_height = 540;	// 540 ; 900
hud_width  = 960;
hud_height = 540;

camera = view_camera[0];
view_set_camera(0, camera);
window_center();