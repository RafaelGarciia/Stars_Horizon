if open{
	if x > xstart-32{
		x -= 1;
	}
	
	//image_index = 1;
	if collision != false{
		instance_destroy(collision);
		collision = false;
	}
}else{
	if x < xstart{
		x += 1;
	}
	//image_index = 0;
	if collision == false{
		collision = instance_create_layer(x, y, "Collision", obj_collision);
	}
}