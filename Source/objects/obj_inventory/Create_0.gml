/// @desc

#region Functions
/// @func add_item(list, item)
/// @desc This function adds an item to the last slot of the inventory list.
/// @arg {Id.DsList}	_index_list	List to add the item.
/// @arg {Struct}		_item		Item (Struct) to add to list.
/// @return {any}
function add_item(_index_list, _item){
	for (var _i = 0; _i<ds_list_size(_index_list); _i++){
		if _index_list[| _i] == undefined{ _index_list[| _i] = _item; break; }
		else if _index_list[| _i].item_id == _item.item_id { _index_list[| _i].quantity += _item.quantity; break; };
	}
}

/// @func clear_select()
/// @desc This local function clears the selected item.
/// @return {any}
clear_select = function (){
	selected_item = undefined;
	selected_position = undefined;
}
#endregion

#region Parameters
//v Variable that defines if the inventory is open or not.
open = false;
//v variable for debug
de_bug = false;

//v Sets the scale of the inventory.
scale = 2;
//v Size of each slot.
slots_size = sprite_get_width(spr_inventory_seletor);
//v Margin in pixels.
pixel_margin = 1 * scale;

//v Amount of columns.
qt_slots_column = sprite_get_width(spr_inventory_hud)%(slots_size)-1;
//v Amount of rows.
qt_slots_row = sprite_get_height(spr_inventory_hud)%(slots_size)-1;
//v Amount of slots.
total_slots = qt_slots_column * qt_slots_row;

//v variables that hold the item selected by the mouse.
selected_item = undefined;
selected_position = undefined;
#endregion

#region List creation
//v Create inventory list.
inventory_list = ds_list_create();
//v sets the size of the list.
for (var _i = 0; _i < total_slots; _i++){
	ds_list_add(inventory_list, undefined);
}
#endregion


// Adicionando items para teste
repeat 5{
	add_item(inventory_list, new Sword());
}
repeat 10{
	add_item(inventory_list, new Bow());
}