in_control = id;
player_id = false;
fullsream = false;

//1280x600; 1366x720; 800x600
//view_hport[0] = display_get_height();
//view_wport[0] = display_get_width();

view_hport[0] = 720;
view_wport[0] = 1366;

window_set_size(view_wport[0], view_hport[0]);
surface_resize(application_surface, view_wport[0], view_hport[0]);
display_set_gui_size(view_wport[0], view_hport[0]);


// 1366/2 = 683
// 1280/2 = 640
// 1280-1366 = 86
// 683-640 = 43


camera_set_view_size(view_camera[0], view_wport[0]/2, view_hport[0]/2);
