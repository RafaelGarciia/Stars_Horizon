if open{
	if alarm[0] <= 0{alarm[0] = 60*5;}
	if _inst{instance_destroy(_inst);  _inst = false;}
	image_index = 1;
	
}else{
	if !_inst{
		_inst = instance_create_layer(x, y, "Instances", obj_collision);
	}
	image_index = 0;
}
