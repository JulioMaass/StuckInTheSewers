function CheckToGetItem(_tile_x, _tile_y){
	
	var _tile_type = tilemap_get(tilemap_id, _tile_x, _tile_y)
	if _tile_type == 5 
	{
		coins += 1
		audio_play_sound(sndCoin, 8, false)
		tilemap_set(tilemap_id, 1, _tile_x, _tile_y)
		//show_debug_message(coins)
	}
	else if _tile_type == 8
	{
		keys += 1
		audio_play_sound(sndCoin, 8, false)
		tilemap_set(tilemap_id, 1, _tile_x, _tile_y)
		//show_debug_message(keys)
	}
	
	//check nearby tiles
	if keys > 0
	{
		var _tile_type_up = tilemap_get(tilemap_id, _tile_x, _tile_y-1);
		var _tile_type_down = tilemap_get(tilemap_id, _tile_x, _tile_y+1);
		var _tile_type_left = tilemap_get(tilemap_id, _tile_x-1, _tile_y);
		var _tile_type_right = tilemap_get(tilemap_id, _tile_x+1, _tile_y);
		
		var _show_hidden_coins = false;
		if _tile_type_up == 6 {tilemap_set(tilemap_id, 7, _tile_x, _tile_y-1); keys -= 1; _show_hidden_coins = true};
		if _tile_type_down == 6 {tilemap_set(tilemap_id, 7, _tile_x, _tile_y+1); keys -= 1; _show_hidden_coins = true};
		if _tile_type_left == 6 {tilemap_set(tilemap_id, 7, _tile_x-1, _tile_y); keys -= 1; _show_hidden_coins = true};
		if _tile_type_right == 6 {tilemap_set(tilemap_id, 7, _tile_x+1, _tile_y); keys -= 1; _show_hidden_coins = true};
		if _show_hidden_coins {ShowHiddenCoins()};
		
		if _tile_type_up == 24 {tilemap_set(tilemap_id, 1, _tile_x, _tile_y-1); keys -= 1};
		if _tile_type_down == 24 {tilemap_set(tilemap_id, 1, _tile_x, _tile_y+1); keys -= 1};
		if _tile_type_left == 24 {tilemap_set(tilemap_id, 1, _tile_x-1, _tile_y); keys -= 1};
		if _tile_type_right == 24 {tilemap_set(tilemap_id, 1, _tile_x+1, _tile_y); keys -= 1};
	}
}