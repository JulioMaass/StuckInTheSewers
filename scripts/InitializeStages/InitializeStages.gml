function InitializeStages(){
	//initialize tileset
	layer_id = layer_get_id("Tiles")
	tilemap_id = layer_tilemap_get_id(layer_id)
	
	//initialize stage constants
	world_stage_size_x = room_width / STAGE_PIXEL_SIZE
	world_stage_size_y = room_height / STAGE_PIXEL_SIZE
	
	
	
	//for (var _x = 0; _x < STAGE_TILE_SIZE; _x += 1)
	//{
	//	for (var _y = 0; _y < STAGE_TILE_SIZE; _y += 1)
	//	{
	//		var _tile_x = _x + _stage_tile_x,
	//			_tile_y = _y + _stage_tile_y,
	//			_tile_type = tilemap_get(tilemap_id, _tile_x, _tile_y)
	//		if _tile_type == 5 then
	//		{
	//			draw_sprite(sprCoin, frame/6, _tile_x * TILE_SIZE, _tile_y * TILE_SIZE)
	//		}
	//	}
	//}
}