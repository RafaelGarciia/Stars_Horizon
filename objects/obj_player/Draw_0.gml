//depth = -bbox_bottom;
draw_sprite_ext(spr_player_shadow, -1, x, bbox_bottom, 1, 1, 0, c_white, image_alpha);


if stoped{
	image_index = 0;
}else{
	if key_run {image_speed = 2} else {image_speed = 1};
	switch view_dir{
		case 0	: sprite_index = spr_player_walk_right;		break;
		case 0.5: sprite_index = spr_player_walk_upright;	break;
		case 1	: sprite_index = spr_player_walk_up;		break;
		case 1.5: sprite_index = spr_player_walk_upleft		break;
		case 2	: sprite_index = spr_player_walk_left;		break;
		case 2.5: sprite_index = spr_player_walk_downleft;	break;
		case 3	: sprite_index = spr_player_walk_down;		break;
		case 3.5: sprite_index = spr_player_walk_downright;	break;
	}
}

image_xscale = 2;
image_yscale = 2;
draw_self();


