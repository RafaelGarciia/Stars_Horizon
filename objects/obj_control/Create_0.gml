in_control = instance_create_layer(60, 80, "Player", obj_player);
in_control.state_free = true;


if !instance_exists(obj_camera){
	instance_create_layer(10, 10, "Player", obj_camera);

}

// Lista de naves:
ship_list =[
//		0			1				2		3		4		5
//		Name		Stack_sprite	Gyros	ac_up	ac_down	ac_side
	["Orphelia",	stack_orphelia, 0.005,  0.02,   0.01,	0.01],
	["Dacer",		stack_dacer,	0.03,	0.05,	0.02,	0.02],


]