if obj_control.in_control == id {

	if key_power_on{power_on = !power_on}

	if key_exit{
		key_exit = false;
		obj_control.player_id.in_veiculo = false;
		obj_control.in_control = obj_control.player_id;
		
		//var _player = instance_nearest(x, y, obj_player);
		//_player.in_veiculo = false;
		//obj_control.in_control = _player;
	}

}

if power_on {
	if reverse{
		var dir_reverse = view_dir+180;
		if key_speed_up and speed <= 0.01 {reverse = false}
		if key_speed_down	{motion_add(dir_reverse, accel_reverse)}
		if key_speed_up		{motion_add(dir_reverse, -accel_forward)}
	}else{
		if key_speed_down and speed <= 0.01  {reverse = true}
		if key_speed_up		{motion_add(view_dir, accel_forward)}
		if key_speed_down	{motion_add(view_dir, -accel_reverse)}
	}
	
	if key_move_forward	 {motion_add(view_dir,		accel_side)}
	if key_move_reverse  {motion_add(view_dir+180,	accel_side)}
	if key_move_left	 {motion_add(view_dir+90,	accel_side)}
	if key_move_right	 {motion_add(view_dir+270,	accel_side)}
	
	if key_spin_left  {spin_dir += 1}
	if key_spin_right {spin_dir -= 1}
	
	
	
	if key_jump{
		key_jump = false;
		room_goto(Room_Jump);
		x = 200;
		y = view_hport[0]/2;
		//y = view_yview[0] + view_hview[0]/2;
		
	}
	
	if key_shild_on{shild_on = !shild_on}
		
}else{
	shild_on = false;
}

if shild_on{
	if instance_shild = false{
		instance_shild = instance_create_layer(x, y, "Instances", obj_ship_shield);
		instance_shild.instance_ship	= id;
		//instance_shild.shild_power		= 100;
	}
}else{
	if instance_shild != false{
		instance_destroy(instance_shild);
		instance_shild = false;
	}
}

if spin_dir > 0{
	//direction += clamp(lerp(0, spin_dir, gyroscope_force), 0, 10);
	view_dir  += clamp(lerp(0, spin_dir, gyroscope_force), 0, 10);

	if key_spin_left == false and key_spin_right == false{
		spin_dir -= 1;
	}
}else if spin_dir < 0{
	//direction -= clamp(lerp(0, -spin_dir, gyroscope_force), 0, 10);
	view_dir  -= clamp(lerp(0, -spin_dir, gyroscope_force), 0, 10);

	if key_spin_left == false and key_spin_right == false{
		spin_dir += 1;
	}
}
