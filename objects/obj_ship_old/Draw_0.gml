image_xscale = sprite_scale;
image_yscale = sprite_scale;
image_angle  = view_dir;


if distance_to_object(obj_player) <= 25*(sprite_scale) and obj_player.in_veiculo == false{image_alpha = 0.1}else{image_alpha = 1}
for (var i=0; i < sprite_get_number(sprite_stack); i++){
	draw_sprite_ext(sprite_stack, i, x, (y - (i*sprite_scale)), sprite_scale, sprite_scale, view_dir, c_white, image_alpha);
}