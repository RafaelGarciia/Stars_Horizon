if keyboard_check_released(vk_f12){
	fullsream = !fullsream;
}

if fullsream{
	var scream_full = 0;
}else{
	var scream_full = 30;
}
window_set_position((display_get_width()/2)-view_wport[0]/2, scream_full);

if in_control == id and keyboard_key{
	in_control = instance_create_layer(100, 100, "Instances", obj_player);
	player_id = in_control;
}



if in_control != id {
	if in_control == player_id{
		camera_set_view_size(view_camera[0], view_wport[0]/2, view_hport[0]/2);
		camera_set_view_border(view_camera[0], 512, 512);
		var _spd_cam = 0.05;
	}else if object_get_name (in_control.object_index) == "obj_ship"{
		camera_set_view_size(view_camera[0], view_wport[0], view_hport[0]);
		var _spd_cam = 0.1;
	}else{
		var _spd_cam = 0.1;
	}

	x = clamp(lerp(x, in_control.x, _spd_cam), 0, room_width );
	y = clamp(lerp(y, in_control.y, _spd_cam), 0, room_height);
	
}