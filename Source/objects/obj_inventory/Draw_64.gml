//v Stores the size of the GUI.
var _gui_width  = display_get_gui_width (),
	_gui_height = display_get_gui_height();

//v Capture the mouse position.
var _mouse_x = device_mouse_x_to_gui(0),
	_mouse_y = device_mouse_y_to_gui(0);


if open{
	//v Calculate inventory position in GUI.
	var _inventory_x = _gui_width/2 - sprite_get_width(spr_inventory_hud);
	var _inventory_y = _gui_height/2 - sprite_get_height(spr_inventory_hud);
	//v Draw the inventory.
	draw_sprite_ext(spr_inventory_hud, 0, _inventory_x, _inventory_y, scale, scale, 0, c_white, 1);
	
	//v row and column counter.
	var _slot_row = 0;
	var _slot_column = 0;
	
	//v goes through all slots.
	for (var _indx = 0; _indx < total_slots; _indx++){
		//v Calculate slot position in inventory (GUI).
		var _slot_x = _inventory_x + 1 + (((slots_size * scale) + pixel_margin) * _slot_column),
		    _slot_y = _inventory_y + 1 + (((slots_size * scale) + pixel_margin) * _slot_row);
		
		//v Check if the mouse is over the slot.
		if point_in_rectangle(_mouse_x, _mouse_y, _slot_x, _slot_y, _slot_x + (slots_size * scale), _slot_y + (slots_size * scale)){
			//v Draw inventory selector in mouse position slot.
			draw_sprite_ext(spr_inventory_seletor, 0, _slot_x, _slot_y, scale, scale, 0, c_white, 1);
			
			//v if use the left button.
			#region Left button
			if mouse_check_button_pressed(mb_left){
				//v if dont have item selected.
				if selected_item == undefined{
					//v Clone the variable.
					selected_item = variable_clone(inventory_list[| _indx]);
					selected_position = _indx;
					//v Checks if the cloned variable is an item (Struct).
					if is_struct(selected_item){
						inventory_list[| _indx] = undefined;
					}
				}//v if have an item and the slot is empty. put the item in the slot.
				else if inventory_list[| _indx] == undefined{
					inventory_list[| _indx] = variable_clone(selected_item);
					clear_select();
				}//v if selected item is same as item slot. 
				else if inventory_list[| _indx].item_id == selected_item.item_id{
					inventory_list[| _indx].quantity += selected_item.quantity;
					clear_select();
				}//v if not. swaps items between the slot and the selected item.
				else{
					var _pass = variable_clone(inventory_list[| _indx]);
					inventory_list[| _indx] = variable_clone(selected_item);
					selected_item = _pass;
				}
			}
			#endregion

			//v If use the right button
			#region right button.
			if mouse_check_button_pressed(mb_right){
				//v if dont have item selected.
				if selected_item == undefined{
					//v Clone the variable.
					selected_item = variable_clone(inventory_list[| _indx]);
					selected_position = _indx;
					//v Checks if the cloned variable is an item (Struct).
					if is_struct(selected_item){
						var _quantity = floor(inventory_list[| _indx].quantity/2);
						//v If Quantity of items is even. divide the amount in half.
						if inventory_list[| _indx].quantity % 2 == 0{
							selected_item.quantity = _quantity;
							inventory_list[| _indx].quantity = _quantity;
						}//v If odd. split in half and add one to slot item.
						else if inventory_list[| _indx].quantity > 1{
							selected_item.quantity = _quantity;
							inventory_list[| _indx].quantity = _quantity + 1;
						}//v If not. take the entire item form the slot.
						else{
							selected_item.quantity = inventory_list[| _indx].quantity;
							inventory_list[| _indx] = undefined;
						}
					}
				}//v If have an item selected.
				else{
					//v if the slot id empty. Puts the selected item in the slot.
					if inventory_list[| _indx] == undefined{
						inventory_list[| _indx] = variable_clone(selected_item);
						inventory_list[| _indx].quantity = 0;
					}//v If the item in the slot is the same as the selected item. add the quantity of the two.
					if inventory_list[| _indx].item_id == selected_item.item_id{
						inventory_list[| _indx].quantity += 1;
						selected_item.quantity -= 1;
						//v If the quantity of the selected item is less than or equal to 0. clears the selected item.
						if selected_item.quantity <= 0{ clear_select() };
					}
				}
			}
			#endregion
		}			

		//v Draw the sprites of the items.
		#region Draw items sprite.
		//v If the slot has an item. draw the sprite item and the quantity of the item.
		if inventory_list[| _indx] != undefined{
			draw_set_font(fnt_inventory);
			draw_set_halign(fa_right);
			
			//v Item sprite.
			draw_sprite_ext(inventory_list[| _indx].sprite.image, inventory_list[| _indx].sprite.index, _slot_x, _slot_y, scale, scale, 0, c_white, 1);
			//v Text for quantity.
			draw_text(_slot_x + (slots_size * scale), _slot_y + (slots_size * scale) - 15, inventory_list[| _indx].quantity);
			
			draw_set_font(-1);
			draw_set_halign(-1);
			
			//v If the quantity in the slot is 0. it empties the slot information.
			if inventory_list[| _indx].quantity <= 0{inventory_list[| _indx] = undefined};
		}
		
		//v Mechanism for counting columns and rows.
		_slot_column++;
		if _slot_column >= qt_slots_column{
			_slot_column = 0;
			_slot_row++;
		}
		#endregion
	}
	
	//v If press escape key. clean the variables and close the inventory.
	if keyboard_check_pressed(vk_escape){
		//v If have an item selected. return the selected item to the slot it was in.
		if selected_item != undefined{
			inventory_list[| selected_position] = selected_item;
		}//v Close the inventory.
		else{open = !open}
		//v Clear the selected item.
		clear_select();
	}
	
	#region Item selected
	//v If have an item selected. Draw the sprite of item following the mouse.
	if selected_item != undefined{
		draw_sprite_ext(selected_item.sprite.image, selected_item.sprite.index, _mouse_x-((slots_size * scale)/2), _mouse_y-((slots_size * scale)/2), scale, scale, 0, c_white, 0.5);
		draw_text(_mouse_x+15, _mouse_y, selected_item.quantity);
	}
	#endregion
}//v If the inventory is closed. return the selected item to the source slot.
else{
	if selected_item != undefined{
		inventory_list[| selected_position] = selected_item;
		clear_select();
	}
}




#region Debug system
if de_bug{
	var _size = ds_list_size(inventory_list);
	draw_set_font(fnt_inventory);
	for (var _i = 0; _i < _size; _i++){
		var _item = inventory_list[| _i];
	
		var _x = 10;
		var _y = 10 + 20 *i;
	
		draw_text(_x, _y, string(_item));
	}
	draw_set_font(-1);
}
#endregion
