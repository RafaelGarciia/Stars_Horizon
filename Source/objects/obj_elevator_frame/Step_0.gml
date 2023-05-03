if door_left == false{
	door_left  = instance_create_layer(x-32, y, "Doors", obj_elevator_door);
	//door_left.sprite_index = spr_elevator_door;
	door_left.image_index = 0;
	//door_left.mask_index = spr_collision;
	//door_left.depth = 410;
	//door_left.visible = true;
}
if door_right == false{
	door_right = instance_create_layer(x, y, "Doors", obj_elevator_door);
	//door_right.sprite_index = spr_elevator_door;
	door_right.image_index = 1;
	//door_right.mask_index = spr_collision;
	//door_right.depth = 410;
	//door_right.visible = true;
}

if open{
	with door_left{
		if x > xstart-32{
			x -= 1;
		}
	}
	
	with door_right{
		if x < xstart+32{
			x += 1;
		}
	}
	if alarm[0] <= 0{
		alarm[0] = 240;
	}
}else{
	with door_left{
		if x < xstart{
			x += 1;
		}
	}
	
	with door_right{
		if x > xstart{
			x -= 1;
		}
	}
}
