if obj_control.in_control == id{
	if key_power_on{power_on = !power_on}
	
	if key_exit {
		key_exit = false;
		obj_control.in_control = accent[0];
		accent[0] = false;
		with obj_control.in_control{
			in_veiculo	= false;
			collision	= true;
		}
	}
	
}

#region Funcs power_on ship:
if power_on {
	
	if key_shild_on {shild_on = !shild_on}
	
	#region Reverse or Forward:
	if reverse{
		if speed <= 0.01 and key_speed_up	{reverse = false}
		if key_speed_up		{motion_add(view_dir+180, -accel_forward)}
		if key_speed_down	{motion_add(view_dir+180, accel_reverse )}
		
	}else{
		if speed <= 0.01 and key_speed_down	{reverse = true }
		if key_speed_up		{motion_add(view_dir, accel_forward )}
		if key_speed_down	{motion_add(view_dir, -accel_reverse)}
	}
	#endregion
	
	#region Move to around:
	if key_move_forward	 {motion_add(view_dir    ,	accel_side)}
	if key_move_reverse  {motion_add(view_dir+180,	accel_side)}
	if key_move_left	 {motion_add(view_dir+90 ,	accel_side)}
	if key_move_right	 {motion_add(view_dir+270,	accel_side)}
	
	if key_spin_left  {spin_dir += 1}
	if key_spin_right {spin_dir -= 1}
	#endregion
	
	
}else{
	shild_on = false;
}
#endregion

#region Mecanics Geral:
if spin_dir > 0 {
	view_dir  += clamp(lerp(0, spin_dir, gyroscope_force), 0, 10);
	if !key_spin_left and !key_spin_right {
		spin_dir -= 1;
	}
}else if spin_dir < 0{
	view_dir  -= clamp(lerp(0, -spin_dir, gyroscope_force), 0, 10);
	if !key_spin_left and !key_spin_right {
		spin_dir += 1;
	}
}



#endregion


























if shild_on {
	if instance_shild = false{
		instance_shild = instance_create_layer(x, y, "Ships", obj_ship_shield);
		instance_shild.instance_ship = id;
	}
}else if instance_shild != false{
	instance_destroy(instance_shild);
	instance_shild = false;
}