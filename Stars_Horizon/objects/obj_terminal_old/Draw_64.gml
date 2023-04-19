if obj_control.in_control == id{
	#region background:
	var ex_x = true, ex_y = true;
	
	if escala_x <= 20{ex_x = false;  escala_x += 0.4;}
	if escala_y <= 10{ex_y = false;  escala_y += 0.2;}
	if ex_x and ex_y {active = true;}
	
	
	draw_sprite_ext(spr_tela, -1, view_wport[0]/2, view_hport[0]/2, escala_x, escala_y, 0, c_white, 1);
	#endregion
	
	if active{
		var _mx = device_mouse_x_to_gui(0),
			_my = device_mouse_y_to_gui(0);
	
		switch tela{
			case Tela.Home:{
				
				if button(spr_button, 100, 100, _mx, _my){
					if spawn_ship("Dacer") {tela = Tela.Spaw_ship} else {tela = Tela.Dock_full}
				}
				
				if button(spr_button, 100, 500, _mx, _my){
					if spawn_ship("Orphelia") {tela = Tela.Spaw_ship} else {tela = Tela.Dock_full}
				}
			}
			break;
			
			case Tela.Spaw_ship:{ // Tela de Spaw de nave bem sucedida.
				draw_text(100, 100, "Sua nave, já esta disponivel na baia de docagem.");
				if keyboard_check(vk_space){
					escala_x = 0;
					escala_y = 0;
					active = false;
					tela = Tela.Home;
					obj_control.in_control = obj_control.player_id;
				}
			}
			break;
			
			case Tela.Dock_full:{ // Tela de dokas cheias
				draw_text(100, 100, "Todas as bayas estão ocupadas, aguarde ate uma delas ser desocupada.");
				if keyboard_check(vk_space){
					tela = Tela.Home;
				}
			}
	}
	
	//draw_rectangle_color(50 , 50, view_wport[0]-50, view_hport[0]-50, c_black, c_black, c_black, c_black, false);
	
	//draw_set_colour(c_lime);
	//draw_set_font(fontCourierNew);
	//draw_text(10, 10, keyboard_string);
	//draw_set_colour(c_white);

	
	}
}
	
	