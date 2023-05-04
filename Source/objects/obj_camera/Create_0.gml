//#macro RESO_W 960
//#macro RESO_H 540
//#macro RESO_SCALE 1

//#macro CAM_SPEED 0.1

//view_enabled	= true;
//view_visible[0] = true;

//camera = camera_create_view(0, 0, RESO_W, RESO_H);

//view_set_camera(0, camera);

//window_set_size(RESO_W * RESO_SCALE, RESO_H * RESO_SCALE);
//surface_resize (application_surface, RESO_W * RESO_SCALE, RESO_H * RESO_SCALE);

//display_set_gui_size(RESO_W, RESO_H);

//var display_width  = display_get_width();
//var display_height = display_get_height();

//var window_width  = RESO_W * RESO_SCALE;
//var window_height = RESO_H * RESO_SCALE;

//window_set_position(display_width/2 - window_width/2, display_height/2 - window_height/2);

//mouse_x_previous = device_mouse_x_to_gui(0);
//mouse_y_previous = device_mouse_y_to_gui(0);



//game_end()



// https://forum.gamemaker.io/index.php?threads/how-to-zoom-out.4125/
/////camera_zoom(x_scale, y_scale, steps, percentage, inside);

//// Zooms the camera by the given factor over given amount of steps.
//// Make sure global.camera_index have been initilazied by using camera_setup().

//// x_scale          = Scale factor for the x value of camera.
//// y_scale          = Scale factor for the y value of camera.
//// steps            = Number of steps for the zoom effect to complete.
//// percentage       = If scaling is percentage (True) or a size value (False).
//// inside           = Whether the camera will be clamped inside room (True) or allow outside (False).

//// Dependencies: eng_camera_zoom, global.camera_index

////Creates variables.
//var x_scale = argument0;
//var y_scale = argument1;
//var steps = argument2;
//var percentage = argument3;
//var inside = argument4;
//var index = global.camera_index;

////Check if scaling is percentage.
//if percentage
//{
//    //Calculates value of new scale.
//    var x_value = view_wview[index] * x_scale;
//    var y_value = view_hview[index] * y_scale;
//}
//else
//{
//    //Sets value of the scale.
//    var x_value = x_scale;
//    var y_value = y_scale;
//}

////Calculates delta.
//var x_delta = x_value - view_wview[index];
//var y_delta = y_value - view_hview[index];

////Calculates step value.
//var x_step = x_delta / steps;
//var y_step = y_delta / steps;

////Create camera object.
//var obj = instance_create(x, y, eng_camera_zoom);

////Sends over variales.
//with obj
//{
//    self.inside = inside;
//    self.x_step = x_step;
//    self.y_step = y_step;
//    self.index = index;
//    alarm[0] = steps;    
//}

//----------------------------------------------------
//Alarm 0 event
/////Suicide
//instance_destroy();
//----------------------------------------------------
//step event
/////Handles Zoom Effect

////Updates view port.
//view_wview[index] += x_step;
//view_hview[index] += y_step;

////Centers the camera.
//view_xview[index] -= x_step / 2;
//view_yview[index] -= y_step / 2;

////Check if inside.
//if inside
//{
//    //Clamps values inside room.
//    view_xview[index] = clamp(view_xview[index], 0, room_width - view_wview[index]);
//    view_yview[index] = clamp(view_yview[index], 0, room_height - view_hview[index]);
//}
