image_xscale = sprite_scale;
image_yscale = sprite_scale;
image_angle  = view_dir;

if place_meeting(x, y-sprite_get_number(sprite_stack), obj_player) and obj_player.in_veiculo == false{
	image_alpha = 0.1;
}else{
	image_alpha = 1;
}

for (var i=0; i < sprite_get_number(sprite_stack); i++){
	draw_sprite_ext(sprite_stack, i, x, (y - (i*image_yscale)), image_xscale, image_yscale, view_dir, c_white, image_alpha);
}