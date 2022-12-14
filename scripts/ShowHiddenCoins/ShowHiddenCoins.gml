// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ShowHiddenCoins(){
	//general info
	var _stage_coordinates = GetStageCoordinates(current_stage),
		_stage_tile_x = _stage_coordinates[0] * STAGE_TILE_SIZE,
		_stage_tile_y = _stage_coordinates[1] * STAGE_TILE_SIZE,
		_stage_pixel_x = _stage_coordinates[0] * STAGE_PIXEL_SIZE,
		_stage_pixel_y = _stage_coordinates[1] * STAGE_PIXEL_SIZE

	//draw animated items
	for (var _x = 0; _x < STAGE_TILE_SIZE; _x += 1)
	{
		for (var _y = 0; _y < STAGE_TILE_SIZE; _y += 1)
		{
			var _tile_x = _x + _stage_tile_x,
				_tile_y = _y + _stage_tile_y,
				_tile_type = tilemap_get(tilemap_id, _tile_x, _tile_y)
			if _tile_type == 9
			{
				tilemap_set(tilemap_id, 5, _tile_x, _tile_y)
			}
		}
	}
}