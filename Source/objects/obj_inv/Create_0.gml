function add_item(_index_list, _item){
	/// @func add_item(index_list, item)
	/// @desc Adiciona um item a lista de inventario.
	/// @arg {DS LIST ID} index_list Index da lista a ser adicionado.
	/// @arg {Struct} item Struct com o item a ser adicionado.
	
	for (var _i = 0; _i<ds_list_size(_index_list); _i++){
		if _index_list[| _i] == undefined{
			_index_list[| _i] = _item;
			break;
		}
	}
}

clear_select = function (){
	selected_item = undefined;
	selected_position = undefined;
}

open = false;

scale = 2;
slots_size = 16 * scale;
qt_slots_column = sprite_get_width(spr_inventory_hud)%slots_size;
qt_slots_row = sprite_get_height(spr_inventory_hud)%slots_size;
total_slots = qt_slots_column * qt_slots_row;
pixel_margin = 1 * scale;

// Criar a lista do inventario
inventory_list = ds_list_create();
for (var _i = 0; _i < total_slots; _i++){
	ds_list_add(inventory_list, undefined);
}

//Declara as varaveis de seleção
selected_item = undefined;
selected_position = undefined;

//Variavel de debug
de_bug = false;



// Adicionando items para teste
add_item(inventory_list, new Sword());
add_item(inventory_list, new Sword());
add_item(inventory_list, new Bow());