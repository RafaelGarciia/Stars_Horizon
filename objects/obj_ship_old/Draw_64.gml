if obj_control.in_control == id{
	
	//if power_on == false{draw_text_ext_color(20, 20, "Power off", 5, 500, c_red, c_red, c_red, c_red, 1)}
	
	draw_text(50, 100, speed);
	draw_rectangle_color(100, 100, 100+(speed*10), 110, c_gray, c_gray, c_gray, c_gray, false);
	
	if instance_shild != false{
		draw_text(50, 200, instance_shild.shild_power);
	}
}