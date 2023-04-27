draw_self();

//draw_set_font();
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color ($FFC579);
draw_text(_text_x, _text_y, text);

draw_set_halign(-1);
draw_set_valign(-1);
draw_set_color (-1);