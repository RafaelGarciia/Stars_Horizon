if obj_control.in_control = id{
	#region Background:
	var pass_x = true, pass_y = true;
	
	if escala_x <= 20{pass_x = false;  escala_x += 0.4;}
	if escala_y <= 10{pass_y = false;  escala_y += 0.2;}
	if pass_x and pass_y {active = true}
	
	draw_sprite_ext(spr_tela, -1, view_wport[0]/2, view_hport[0]/2, escala_x, escala_y, 0, c_white, 1);
	#endregion
	
	if active{
		var _mouse_x = device_mouse_x_to_gui(0),
			_mouse_y = device_mouse_y_to_gui(0);
			
		switch screen{
			case Screens.Home:{
				if button(spr_button, 100, 100, _mouse_x, _mouse_y) == mb_left{
					if spawn_ship("Dacer") {screen = Screens.Spaw_ship} else {screen = Screens.Dock_full}
				}
				
				if button(spr_button, 100, 200, _mouse_x, _mouse_y){
					if spawn_ship("Orphelia") {screen = Screens.Spaw_ship} else {screen = Screens.Dock_full}
				}
			};break;
			
			case Screens.Spaw_ship:{
				draw_text(100, 100, "Sua nave esta disponivel na doca " + string(spaw_bay) + "!");
				if key_ok{
					key_exit = true;
				}
			}break;
			
			case Screens.Dock_full:{
				draw_text(100, 100, "Todas as docas estão ocupadas, aguarde ate uma ser desocupada !");
				if key_ok{
					key_exit = true;
				}
			}
		}
	}
}