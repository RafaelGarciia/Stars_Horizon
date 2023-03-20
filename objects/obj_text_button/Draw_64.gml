draw_self();

draw_set_font(fnt_menu);
draw_set_halign(halign);
draw_set_valign(valign);
draw_set_alpha (image_alpha);


draw_text_outlined(x, y, string(text), text_scale, text_scale,image_angle, text_outline_color, text_color);


draw_set_alpha (1);
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_color (-1);


if de_bug {
	sprite_index = spr_botao;
}else{
	sprite_index = spr_text_button;
}

if keyboard_check_released(vk_delete){
	de_bug = !de_bug;
}