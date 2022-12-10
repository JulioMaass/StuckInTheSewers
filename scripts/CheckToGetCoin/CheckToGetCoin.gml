function CheckToGetCoin(_tile_x, _tile_y){
	
	var _tile_type = tilemap_get(tilemap_id, _tile_x, _tile_y)
	if _tile_type == 5 
	{
		coins += 1
		audio_play_sound(sndCoin, 8, false)
		tilemap_set(tilemap_id, 1, _tile_x, _tile_y)
		//show_debug_message(coins)
	}
}