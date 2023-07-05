// Pega o tamanho da GUI
var _gui_widht  = display_get_gui_width();
var _gui_height = display_get_gui_height();

// Pega o x e y do mouse
var _mouse_x = device_mouse_x_to_gui(0);
var _mouse_y = device_mouse_y_to_gui(0);

// Quando o inventario esta aberto
if open == true{
	// Pega onde ficara posicionado o inventario
	var _inventory_x = _gui_widht/2  - inventory_spr_width/2;
	var _inventory_y = _gui_height/2 - inventory_spr_height/2;
	
	// Desenha o backgroud do inventario
	draw_sprite_ext(spr_inventory, 0, _inventory_x, _inventory_y, scale, scale, 0, c_white, 1);
	
	// Inicia a variavel que controla as linhas e as colunas de slots 
	var _slot_row	 = 0;
	var _slot_column = 0;
	
	// Loop para interagir com os slots onde I represente o index do slot
	for (var i = 0; i < total_slots; i++){
		// Calcula o ponto x e y donde ficara o slot
		var _slots_x = _inventory_x + first_slot_x + ((slots_size + pixel_margin) * _slot_row);
		var _slots_y = _inventory_y + first_slot_y + ((slots_size + pixel_margin) * _slot_column);
		
		#region Interação com o mouse
		// Se o mouse estiver em cima do slot
		if point_in_rectangle(_mouse_x, _mouse_y, _slots_x, _slots_y, _slots_x + slots_size, _slots_y + slots_size){
			// Desenha a sprite do seletor
			draw_sprite_ext(spr_inventory_seletor, 0, _slots_x, _slots_y, scale, scale, 0, c_white, 1);
			
			// Apertando F e o slot não estiver vazio, dropamos o item que esta apontado pelo mouse
			if keyboard_check_pressed(ord("F")) and inventory_grid[# Infos.Item, i] != -1{
				// Cria a instancia do item
				var _inst = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_item);
				// Transfere as informações para a instancia do item
				_inst.sprite_index	= inventory_grid[# Infos.Sprite	 , i];
				_inst.image_index	= inventory_grid[# Infos.Item	 , i];
				_inst.quantity		= inventory_grid[# Infos.Quantity, i];
				
				// Esvazia o slot do item dropado
				inventory_grid[# Infos.Item		, i] = -1;
				inventory_grid[# Infos.Quantity	, i] = -1;
				inventory_grid[# Infos.Sprite	, i] = -1;
			}
			
			// Se clicarmos com o botão esquerdo
			if mouse_check_button_pressed(mb_left){
				// Se o item selecionado for nulo / vazio
				if selected_item == -1{
					// O item selecionado sera o item que esta no slot
					selected_item = inventory_grid[# Infos.Item, i];
					// Armazena o index do slot
					selected_position = i;
				}
				// Se o item selecionado não for nulo / vazio
				else{
					// Se o item selecionado for igual ao item apontado pelo mouse e não for o mesmo slot selecionado e a sprite do item selecionado for igual a sprite do item apontado pelo mouse
					if selected_item == inventory_grid[# Infos.Item, i] and selected_position != i and inventory_grid[# Infos.Sprite, i] == inventory_grid[# Infos.Sprite, selected_position]{
						// Staca os items
						inventory_grid[# Infos.Quantity, i] += inventory_grid[# Infos.Quantity, selected_position];
						
						// Limpa o slot selecionado do DB inventario
						inventory_grid[# Infos.Item		, selected_position] = -1;
						inventory_grid[# Infos.Quantity	, selected_position] = -1;
						inventory_grid[# Infos.Sprite	, selected_position] = -1;
						
						// Deseleciona o item
						selected_item	  = -1;
						selected_position = -1;
					}
					// Se o slot apontado pelo mouse for nulo / vazio
					else if inventory_grid[# Infos.Item, i] == -1{
						// Transfere as informações para o novo slot
						inventory_grid[# Infos.Item		, i] = inventory_grid[# Infos.Item		, selected_position];
						inventory_grid[# Infos.Quantity	, i] = inventory_grid[# Infos.Quantity	, selected_position];
						inventory_grid[# Infos.Sprite	, i] = inventory_grid[# Infos.Sprite	, selected_position];
						
						// Limpa o slot selecionado do DB inventario
						inventory_grid[# Infos.Item		, selected_position] = -1;
						inventory_grid[# Infos.Quantity	, selected_position] = -1;
						inventory_grid[# Infos.Sprite	, selected_position] = -1;
						
						// Deseleciona o item
						selected_item	  = -1;
						selected_position = -1;
					}
					// Se o item selecionado for diferente do item apontado pelo mouse ou a sprite do item selecionado for diferente da apontada pelo mouse
					else if inventory_grid[# Infos.Item, selected_position] != inventory_grid[# Infos.Item, i] or inventory_grid[# Infos.Sprite, selected_position] != inventory_grid[# Infos.Sprite, i]{
						// Armazena as informações do item apontado pelo mouse
						var _item	  = inventory_grid[# Infos.Item		, i];
						var _quantity = inventory_grid[# Infos.Quantity , i];
						var _sprite	  = inventory_grid[# Infos.Sprite	, i];
						
						// Transfere as informações do item selecionado para o slot apontado pelo mouse
						inventory_grid[# Infos.Item		, i] = inventory_grid[# Infos.Item		, selected_position];
						inventory_grid[# Infos.Quantity , i] = inventory_grid[# Infos.Quantity	, selected_position];
						inventory_grid[# Infos.Sprite	, i] = inventory_grid[# Infos.Sprite	, selected_position];
						
						// Trasnfere as informações salvas do item para o slot selecionado
						inventory_grid[# Infos.Item		, selected_position] = _item;
						inventory_grid[# Infos.Quantity	, selected_position] = _quantity;
						inventory_grid[# Infos.Sprite	, selected_position] = _sprite;
						
						// Deseleciona o item
						selected_item = -1;
						selected_position = -1;
					}
				}
			}
		}
		#endregion
		
		#region Desenhando os itens nos slots
		// Armazena a sprite do item para poder desenhar ele
		var _sprite = inventory_grid[# Infos.Sprite, i];
		
		// Se o item não for nulo / vazio na DB do inventario
		if inventory_grid[# Infos.Item, i] != -1{
			// Desenha a sprite do item no slot
			draw_sprite_ext(_sprite, inventory_grid[# Infos.Item, i], _slots_x,  _slots_y, scale, scale, 0, c_white, 1);
			
			// Seta os parametros para o texto
			draw_set_font(fnt_inventory);
			draw_set_halign(fa_right);
			// Desenha o texto referente a quantidade do item
			draw_text(_slots_x + (slots_size), _slots_y + (slots_size-15), inventory_grid[# Infos.Quantity, i]);
		}
		
		// Adiciona um a contagem de colunas
		_slot_row++;
		// Se o numero de slots for maior ou igual o numero de slots configurado para a coluna
		if _slot_row >= slots_horizontal{
			// Volta para a primeira coluna
			_slot_row = 0;
			// Pula para a proxima linha
			_slot_column++;
		}
		#endregion
	}
	
	// Se Clicarmos com o botão do mouse direito
	if mouse_check_button_pressed(mb_right){
		// Deseleciona o item
		selected_item	  = -1;
		selected_position = -1;
	}
	
	// Se selecionarmos algum item
	if selected_item != -1{
		// Desenha a sprite do item selecionado para auxilio
		draw_sprite_ext(inventory_grid[# Infos.Sprite, selected_position], selected_item, _mouse_x, _mouse_y, scale, scale, 0, c_white, 0.5);
	}
}