// Lista de naves:
ship_list =[
//		0			1				2		3		4		5
//		Name		Stack_sprite	Gyros	ac_up	ac_down	ac_side
	["Orphelia",	stack_orphelia, 0.005,  0.02,   0.01,	0.01],
	["Dacer",		stack_dacer,	0.03,	0.05,	0.02,	0.02],


]

// Seleciona a nave:
var model;
switch ship_model{
	case "Orphelia"	:		model = 0; break;
	case "Dacer"	:		model = 1; break;
	
	
	default:	show_message("Error: ship_model = None"); break;
}

// Carrega as especificações da nave celecionada:
sprite_stack	= ship_list[model][1];
mask_index		= sprite_stack;
gyroscope_force	= ship_list[model][2];
accel_forward	= ship_list[model][3];
accel_reverse	= ship_list[model][4];
accel_side		= ship_list[model][5];


hud = instance_create_layer(x, y, "Instances", obj_ship_hud);
hud.instance_ship = id;






//player
player_in = false;

// Sprite control
sprite_scale = 3;

// Specs ship

//System ship:
power_on = false;
shild_on = false;
reverse = false;


instance_shild = false;

// Mecacicas
spin_dir = 0;
view_dir = direction;

// Fisica
friction = 0.005;


