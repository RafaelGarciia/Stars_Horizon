
var model;
switch ship_model{
	case "Orphelia"	:		model = 0; break;
	case "Dacer"	:		model = 1; break;
	
	
	default:	show_message("Error: ship_model = None"); break;
}

sprite_scale	= 3;
sprite_stack	= obj_control.ship_list[model][1];
mask_index		= sprite_stack;
gyroscope_force	= obj_control.ship_list[model][2];
accel_forward	= obj_control.ship_list[model][3];
accel_reverse	= obj_control.ship_list[model][4];
accel_side		= obj_control.ship_list[model][5];
power_on		= false;
shild_on		= false;
reverse			= false;
spin_dir		= 0;
view_dir		= 0;
friction = 0.005;

// accent 0 = Accent_control_ship
accent = [false, false];














instance_shild = false;