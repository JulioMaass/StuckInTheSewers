function ApplyMovement(){
	//skip this function if there is no movement
	if dir_x == 0 and dir_y == 0 
	{
		return
	}
	
	//get destiny tile type
	var _next_x = player_x + dir_x,
		_next_y = player_y + dir_y,
		_next_tile_type = tilemap_get(tilemap_id, _next_x, _next_y)
	
	//code for free destiny
	var _tile_is_free = _next_tile_type == 1 or _next_tile_type == 5
	if _tile_is_free 
	{
		player_x = _next_x
		player_y = _next_y
		CheckToGetCoin(player_x, player_y)
		SetStepAnimation(dir_x, dir_y, STEP_TYPE_JUMP)
		return
	}
	
	//code for pipe destiny
	var	_tileset_x = _next_tile_type % 16,
		_tileset_y = floor(_next_tile_type / 16),
		_tile_is_pipe = _tileset_x >= 10 and _tileset_x <= 13 and _tileset_y <= 7
	if _tile_is_pipe 
	{
		var _pipe_direction = _tileset_x,
			_pipe_color = _tileset_y,
			_pipe_is_vertical = _pipe_direction == PIPE_UP or _pipe_direction == PIPE_DOWN,
			_can_enter_vertical = dir_y != 0 and _pipe_is_vertical,
			_can_enter_horizontal = dir_x != 0 and !_pipe_is_vertical,
			_can_enter = _can_enter_vertical or _can_enter_horizontal
		
		if _can_enter 
		{
			player_x = _next_x
			player_y = _next_y
			SetStepAnimation(dir_x, dir_y, STEP_TYPE_ENTER)
			
			//turn on fade out
			if _pipe_color == PIPE_WHITE or _pipe_color == PIPE_BLACK 
			{
				fade_frame = 20
			}
		}
	}
}
