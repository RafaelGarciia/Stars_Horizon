if active {
	if !anime{
		anime = layer_sequence_create("Menu", 0, display_get_gui_height()/2, sq_main_menu);
	}
}else{
	layer_sequence_destroy(anime);
	anime = false;
}