var camX = camera_get_view_x(camera);
var camY = camera_get_view_y(camera);

var camW = camera_get_view_width(camera);
var camH = camera_get_view_height(camera);

if mouse_check_button(mb_middle){
	var move_x = device_mouse_x_to_gui(0) - mouse_x_previous;
	var move_y = device_mouse_y_to_gui(0) - mouse_y_previous;
	
	camX -= move_x;
	camY -= move_y;
	
	camX = clamp(camX, 0, room_width  - camW);
	camY = clamp(camY, 0, room_height - camH);
	
	//if camX+camW >= room_width and move_x < 0 {
	//	camX = room_width-camW;
	//}else if camX <= 0 and move_x > 0 {
	//	camX = 0;
	//}else{ camX -= move_x }
	
	//if camY+camH >= room_height and move_y < 0 {
	//	camY = room_height-camH;
	//}else if camY <= 0 and move_y > 0 {
	//	camY = 0;
	//}else{ camY -= move_y }
	
}else{
	var targetX = obj_player.x - camW/2;
	var targetY = obj_player.y - camH/2;

	targetX = clamp(targetX, 0, room_width  - camW);
	targetY = clamp(targetY, 0, room_height - camH);

	camX = clamp(lerp(camX, targetX, CAM_SPEED), 0, room_width );
	camY = clamp(lerp(camY, targetY, CAM_SPEED), 0, room_height);
}

var wheel = mouse_wheel_down() - mouse_wheel_up();

if wheel != 0{
	wheel *= 0.1;
	
	var addW = camW * wheel;
	var addH = camH * wheel;
	
	camW += addW;
	camH += addH;
	
	var prevW = camW;
	var prevH = camH;
	var cam_W = clamp(camW, RESO_W/2, room_width);
	var cam_H = clamp(camH, RESO_H/2, room_width);

	show_debug_message(cam_W)

	if camW / camH == 1.777777777777778 and (prevW == cam_W or prevH == cam_H){
		camW -= addW/2;
		camH -= addH/2;
	}else{
		camW = prevW - addW;
		camH = prevH - addH;
	}
}

//if wheel != 0{
//	wheel *= 0.1;
	
//	var addW = camW * wheel;
//	var addH = camH * wheel;
	
//	camW += addW;
//	camH += addH;
	
//	camX -= addW / 2;
//	camY -= addH / 2;
//}

camera_set_view_pos (camera, camX, camY);
camera_set_view_size(camera, camW, camH);

mouse_x_previous = device_mouse_x_to_gui(0);
mouse_y_previous = device_mouse_y_to_gui(0);