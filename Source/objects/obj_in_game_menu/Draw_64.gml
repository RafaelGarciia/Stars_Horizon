if open{
	for (var _i = 0; _i < ds_list_size(option_list); _i++){
		//draw_text(100, (20*_i), option_list[| _i]);
		draw_set_font(fnt_in_game_menu);
		draw_text_transformed(100, 100+(50*_i), option_list[| _i], 1, 1, 0);
		draw_set_font(-1);
	}
}