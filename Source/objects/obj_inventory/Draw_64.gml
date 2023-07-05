var _gui_width  = display_get_gui_width (),
	_gui_height = display_get_gui_height();
	
var _mouse_x = device_mouse_x_to_gui(0),
	_mouse_y = device_mouse_y_to_gui(0);
	
if open{
	var _inventory_x = _gui_width/2 - sprite_get_width(spr_inventory_hud);
	var _inventory_y = _gui_height/2 - sprite_get_height(spr_inventory_hud);
	
	
	draw_sprite_ext(spr_inventory_hud, 0, _inventory_x, _inventory_y, scale, scale, 0, c_white, 1);
	
	var _slot_row = 0;
	var _slot_collumn = 0;
	
	for (var _indx = 0; _indx < total_slots; _indx++){
		var _slot_x = _inventory_x + 1 + ((slots_size + pixel_margin) * _slot_collumn),
		    _slot_y = _inventory_y + 1 + ((slots_size + pixel_margin) * _slot_row);


		if point_in_rectangle(_mouse_x, _mouse_y, _slot_x, _slot_y, _slot_x + slots_size, _slot_y + slots_size){
			draw_sprite_ext(spr_inventory_seletor, 0, _slot_x, _slot_y, scale, scale, 0, c_white, 1);


			if mouse_check_button_pressed(mb_left){
				if selected_item == undefined{
					selected_item = variable_clone(inventory_list[| _indx]);
					selected_position = _indx;
					if is_struct(selected_item){
						inventory_list[| _indx] = undefined;
					}
				}
				else if inventory_list[| _indx] == undefined{
					inventory_list[| _indx] = variable_clone(selected_item);
					clear_select();
				}
				else if inventory_list[| _indx].item_id == selected_item.item_id{
					inventory_list[| _indx].quantity += selected_item.quantity;
					clear_select();
				}
				else{
					var _pass = variable_clone(inventory_list[| _indx]);
					inventory_list[| _indx] = variable_clone(selected_item);
					selected_item = _pass;
				}
			}


			if mouse_check_button_pressed(mb_right){
				if selected_item == undefined{
					selected_item = variable_clone(inventory_list[| _indx]);
					selected_position = _indx;
					if is_struct(selected_item){
						
						var _quantity = floor(inventory_list[| _indx].quantity/2);
						if inventory_list[| _indx].quantity % 2 == 0{
							selected_item.quantity = _quantity;
							inventory_list[| _indx].quantity = _quantity;
						}
						else if inventory_list[| _indx].quantity > 1{
							selected_item.quantity = _quantity;
							inventory_list[| _indx].quantity = _quantity + 1;
						}
						else{
							selected_item.quantity = inventory_list[| _indx].quantity;
							inventory_list[| _indx] = undefined;
						}
					}
				}
				else{
					if inventory_list[| _indx] == undefined{
						
						inventory_list[| _indx] = variable_clone(selected_item);
						inventory_list[| _indx].quantity = 0;
					}
					if inventory_list[| _indx].item_id == selected_item.item_id{
						inventory_list[| _indx].quantity += 1;
						selected_item.quantity -= 1;
						if selected_item.quantity == 0{ clear_select() };
					}
				}
			}
		}			




		if inventory_list[| _indx] != undefined{
			draw_sprite_ext(inventory_list[| _indx].sprite.image, inventory_list[| _indx].sprite.index, _slot_x, _slot_y, scale, scale, 0, c_white, 1);
		
			draw_set_font(fnt_inventory);
			draw_set_halign(fa_right);
			
			draw_text(_slot_x + slots_size, _slot_y + slots_size-15, inventory_list[| _indx].quantity);
			
			draw_set_font(-1);
			draw_set_halign(-1);
		}
		
		if inventory_list[| _indx] != undefined and inventory_list[| _indx].quantity == 0{
			inventory_list[| _indx] = undefined;
		}
		
		_slot_collumn++;
		if _slot_collumn >= qt_slots_column{
			_slot_collumn = 0;
			_slot_row++;
		}
	}
	
	if keyboard_check_pressed(vk_escape){
		inventory_list[| selected_position] = selected_item;
		selected_item = undefined;
		selected_position = undefined;
	}
	
	if selected_item != undefined{
		draw_sprite_ext(selected_item.sprite.image, selected_item.sprite.index, _mouse_x-(slots_size/2), _mouse_y-(slots_size/2), scale, scale, 0, c_white, 0.5);
		draw_text(_mouse_x+15, _mouse_y, selected_item.quantity);
		show_debug_message(selected_item.quantity);
	}
	
}





if de_bug{
	var _size = ds_list_size(inventory_list);
	draw_set_font(fnt_inventory);
	for (var _i = 0; _i < _size; _i++){
		var _item = inventory_list[| _i];
	
		var _x = 10;
		var _y = 10 + 20 * _i;
	
		draw_text(_x, _y, string(_item));
	}
	draw_set_font(-1);
}