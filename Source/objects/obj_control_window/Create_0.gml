win_height = 768;
win_width = 1366;


display_set_gui_size(win_width, win_height);
window_set_size(win_width, win_height);
surface_resize(application_surface, win_width, win_height);
window_center();