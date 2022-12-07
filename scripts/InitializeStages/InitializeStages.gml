function InitializeStages(){
	//initialize tileset
	layer_id = layer_get_id("Tiles")
	tilemap_id = layer_tilemap_get_id(layer_id)
	
	//initialize stage constants
	world_stage_size_x = room_width / STAGE_PIXEL_SIZE
	world_stage_size_y = room_height / STAGE_PIXEL_SIZE
	total_stages = world_stage_size_x * world_stage_size_y
	
	//create list of white and black pipes
	white_pipe_list[0] = {};
	black_pipe_list[0] = {};
	for (var _stage = 0; _stage < total_stages; _stage += 1)
	{
		var _stage_coordinates = GetStageCoordinates(_stage),
			_stage_tile_x = _stage_coordinates[0] * STAGE_TILE_SIZE,
			_stage_tile_y = _stage_coordinates[1] * STAGE_TILE_SIZE
		for (var _x = 0; _x < STAGE_TILE_SIZE; _x += 1)
		{
			for (var _y = 0; _y < STAGE_TILE_SIZE; _y += 1)
			{
				var _tile_x = _x + _stage_tile_x,
					_tile_y = _y + _stage_tile_y,
					_tile_type = tilemap_get(tilemap_id, _tile_x, _tile_y),
					_tileset_x = _tile_type % 16,
					_tileset_y = floor(_tile_type / 16),
					_tile_is_pipe = _tileset_x >= 10 and _tileset_x <= 13 and _tileset_y <= 7,
					_pipe_color = _tileset_y
				if _tile_is_pipe
				{
					if _pipe_color == PIPE_WHITE
					{
						white_pipe_list[_stage] = {x: _x, y: _y};
					}
					if _pipe_color == PIPE_BLACK
					{
						black_pipe_list[_stage] = {x: _x, y: _y};
					}
				}
			}
		}
	}
}