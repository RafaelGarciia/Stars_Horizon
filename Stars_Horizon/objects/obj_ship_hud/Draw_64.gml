if obj_control.in_control == instance_ship{
	if instance_ship.power_on = false {
		if alpha_power >= 1{
			inc_alpha = -0.02;
		}else if alpha_power <= 0{
			inc_alpha = +0.02;
		}
		
		show_debug_message("Alpha: {0}   Inc: {1}", alpha_power, inc_alpha);
		alpha_power += inc_alpha;
		draw_sprite_ext(spr_hud_power_on, 0, 50, 50, 1, 1, 0, -1, alpha_power);
	}

}
