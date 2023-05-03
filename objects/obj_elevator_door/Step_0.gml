if open{
	if move_left{
		if x > xstart-32{
			x -= 1;
		}
	}else{
		if x < xstart+32{
			x += 1;
		}
	}
	
	//image_index = 1;
	if collision != false{
		instance_destroy(collision);
		collision = false;
	}
	if alarm[0] <= 0{
		alarm[0] = 240;
	}
}else{
	if move_left{
		if x < xstart{
			x += 1;
		}
	}else{
		if x > xstart{
			x -= 1;
		}
	}

	//image_index = 0;
	if collision == false{
		collision = instance_create_layer(xstart, y, "Collision", obj_collision);
	}
}


