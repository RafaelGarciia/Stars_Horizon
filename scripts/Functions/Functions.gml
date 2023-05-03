/// @description Draw text with an outline
/// @param {num} _x
/// @param {num} _y
/// @param {string} _string
/// @param {num} _xscale
/// @param {num} _yscale
/// @param {num} _angle
/// @param {col} _outline_color
/// @param {col} _string_color
function draw_text_outlined (_x, _y, _string, _xscale, _yscale, _angle, _outline_color, _string_color){
	var _bord = 2;
	draw_set_color(_outline_color);
	
	if _outline_color == false{}else{
		draw_text_transformed(_x + _bord, _y + _bord, _string, _xscale, _yscale, _angle);  
		draw_text_transformed(_x - _bord, _y - _bord, _string, _xscale, _yscale, _angle);  
		draw_text_transformed(_x		, _y + _bord, _string, _xscale, _yscale, _angle);  
		draw_text_transformed(_x + _bord, _y		, _string, _xscale, _yscale, _angle);  
		draw_text_transformed(_x		, _y - _bord, _string, _xscale, _yscale, _angle);  
		draw_text_transformed(_x - _bord, _y		, _string, _xscale, _yscale, _angle);  
		draw_text_transformed(_x - _bord, _y + _bord, _string, _xscale, _yscale, _angle);  
		draw_text_transformed(_x + _bord, _y - _bord, _string, _xscale, _yscale, _angle);  
	}
	draw_set_color(_string_color);
	
	draw_text_transformed(_x, _y, _string, _xscale, _yscale, _angle);
}


/// @description Draw a button (old)
/// @param {image_index} 
/// @param {num} _x
/// @param {num} _y
/// @param {num} _mouse_x
/// @param {num} _mouse_y
/// @param {num} _scale_x
/// @param {num} _scale_y
function button(_sprite, _x, _y, _mouse_x, _mouse_y, _scale_x = 1, _scale_y = 1){
	var _spr_w = sprite_get_width (_sprite)/2,
		_spr_h = sprite_get_height(_sprite)/2;
	
	draw_sprite_ext(_sprite, 0, _x, _y, _scale_x, _scale_y, image_angle, image_blend, image_alpha);
	if point_in_rectangle(_mouse_x, _mouse_y, (_x - _spr_w*_scale_x), (_y - _spr_h*_scale_y), (_x + _spr_w*_scale_x), (_y + _spr_h*_scale_y)){
		image_blend = c_blue;
		if mouse_check_button_released(mb_left){
			return mb_left;
		}
	}else{
		image_blend = c_white;
	}
}